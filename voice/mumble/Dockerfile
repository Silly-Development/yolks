FROM      --platform=$TARGETOS/$TARGETARCH alpine:edge

LABEL       author="Silly Development" maintainer="gamer@sillydev.co.uk"

LABEL     org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL     org.opencontainers.image.licenses=MIT

##    install dependencies
RUN   apk add --no-cache murmur tini

RUN   adduser -D container

RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
USER   container
ENV    USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/sbin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
