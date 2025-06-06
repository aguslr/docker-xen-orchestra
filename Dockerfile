ARG BASE_IMAGE=library/node:lts-slim

FROM docker.io/${BASE_IMAGE}

ARG APP_REPO=https://github.com/vatesfr/xen-orchestra
ARG APP_TAG=master

WORKDIR /opt/app
RUN <<-EOT sh
	set -eu

	apt-get update
	env DEBIAN_FRONTEND=noninteractive \
		apt-get install -y --no-install-recommends \
		ca-certificates supervisor build-essential \
		redis-server libpng-dev git python3-minimal libvhdi-utils lvm2 \
		cifs-utils nfs-common ntfs-3g openssl \
		-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
	apt-get clean && rm -rf /var/lib/apt/lists/* /var/lib/apt/lists/*

	mkdir -p /var/log/supervisord /var/run/supervisord

	git clone --depth=1 -b ${APP_TAG} ${APP_REPO} .

	yarn && yarn build
	cd packages/xo-server
	mkdir -p ~/.config/xo-server
	cp sample.config.toml ~/.config/xo-server/config.toml || true
EOT

COPY rootfs/ /

EXPOSE 80/tcp

VOLUME /var/lib/xo-server

HEALTHCHECK --interval=1m --timeout=3s \
  CMD timeout 2 bash -c 'cat < /dev/null > /dev/tcp/127.0.0.1/80'

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]
