FROM        --platform=$TARGETOS/$TARGETARCH golang:1.20-alpine

LABEL       author="Silly Development" maintainer="gamer@sillydev.co.uk"

RUN         apk add --update --no-cache ca-certificates tzdata \
				&& adduser -D -h /home/container container
RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]
