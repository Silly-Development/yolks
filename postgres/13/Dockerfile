# ----------------------------------
# Environment: Postgres DB
# ----------------------------------
FROM --platform=$TARGETOS/$TARGETARCH postgres:13-alpine

LABEL       author="Silly Development" maintainer="gamer@sillydev.co.uk"

# UID 999 is the default pterodactyl user
RUN adduser -D -h /home/container container

RUN     apk add --no-cache tini curl iproute2 ca-certificates fontconfig git openssl sqlite tar tzdata
RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
USER container
ENV HOME /home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/sbin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
