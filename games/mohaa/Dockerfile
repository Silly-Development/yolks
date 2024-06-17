FROM        ghcr.io/parkervcp/yolks:debian

LABEL       author="Manuel Dielacher" maintainer="th3dilli@gmx.at"

LABEL       org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL       org.opencontainers.image.licenses=MIT
RUN rm -rf /usr/bin/dd \
 && rm -rf /usr/bin/fallocate \
 && rm -rf /usr/bin/truncate \
 && rm -rf /usr/bin/xfs_mkfile 
RUN			dpkg --add-architecture i386 \
			&& apt update && apt upgrade -y \
			&& apt install -y lib32gcc-s1 lib32stdc++6 libstdc++5:i386


