# ----------------------------------
# Environment: MongoDB
# ----------------------------------
FROM        --platform=$TARGETOS/$TARGETARCH mongo:6-jammy

LABEL       author="Silly Development" maintainer="gamer@sillydev.co.uk"

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
            && apt install -y netcat iproute2 \
            && useradd -d /home/container -m container -s /bin/bash
RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
