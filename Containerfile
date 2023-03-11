# Multi-stage build
ARG FEDORA_MAJOR_VERSION=37

## Build ublue-os-base
FROM ghcr.io/ublue-os/base-nvidia:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc
COPY usr /usr
COPY myceliumupdate.sh /usr/bin/myceliumupdate.sh

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install xorg-x11-xinit xorg-x11-server-Xorg xorg-x11-server-utils lightdm java-11-openjdk execstack screen && \

    chmod +x /usr/bin/myceliumupdate.sh && \

    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target && \

    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    rm -rf \
        /tmp/* \
        /var/* && \
    ostree container commit
