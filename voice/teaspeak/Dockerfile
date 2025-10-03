
FROM      --platform=$TARGETOS/$TARGETARCH debian:bookworm-slim

LABEL       author="Silly Development" maintainer="gamer@sillydev.co.uk"

ENV       DEBIAN_FRONTEND=noninteractive

##    update base packages
RUN       apt update \
          &&   apt upgrade -y

##    install dependencies
RUN   apt install -y ffmpeg curl python3 iproute2 libjemalloc2 tini

RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
# Install latest youtube-dl
RUN   curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/youtube-dl
RUN   chmod a+rx /usr/local/bin/youtube-dl

RUN   update-alternatives --install  /usr/bin/python python /usr/bin/python3 1000

RUN   useradd -m -d /home/container container

USER   container
ENV    USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
