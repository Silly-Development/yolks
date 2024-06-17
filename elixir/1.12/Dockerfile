FROM --platform=$TARGETOS/$TARGETARCH elixir:1.12.3-slim

LABEL       author="Silly Development" maintainer="gamer@sillydev.co.uk"

RUN  apt update \
            && apt -y install git dnsutils curl iproute2 ffmpeg tini \
            && useradd -m -d /home/container container
RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
