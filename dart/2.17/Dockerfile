FROM        --platform=$TARGETOS/$TARGETARCH dart:2.17

LABEL       author="Silly Development" maintainer="gamer@sillydev.co.uk"

RUN         apt update \
            && apt -y install iproute2 git ca-certificates tzdata tini \
            && useradd -m -d /home/container container
RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
