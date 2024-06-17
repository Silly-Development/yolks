FROM    --platform=$TARGETOS/$TARGETARCH debian:bookworm

LABEL       author="Silly Development" maintainer="gamer@sillydev.co.uk"

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt update -y \
        # general packages
     && apt install -y iproute2 ca-certificates \
        # additional packages for tesseract and eng lang support
        libtesseract-dev tesseract-ocr-eng \
        # add container user to run application
     && useradd -m -d /home/container container
RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
USER    container
ENV     USER=container HOME=/home/container
WORKDIR /home/container

COPY    ./entrypoint.sh /entrypoint.sh
CMD     ["/bin/bash", "/entrypoint.sh"]
