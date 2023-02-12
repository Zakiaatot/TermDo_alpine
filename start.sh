#! /system/bin/sh
# termdo start
BASE_DIR="/data/data/com.termdo/files"
INSTALL_DIR="${BASE_DIR}/termdo_alpine"
PROOT="proot-v5.3.0-aarch64-static"

export PROOT_TMP_DIR=${INSTALL_DIR}/tmp
cd ${BASE_DIR}
./${PROOT} \
    --kernel-release=5.4.0-faked \
    --link2symlink \
    --kill-on-exit \
    --rootfs="${INSTALL_DIR}" \
    --root-id \
    --cwd=/root \
    --bind=/dev \
    --bind="/dev/urandom:/dev/random" \
    --bind=/proc \
    --bind="/proc/self/fd:/dev/fd" \
    --bind="/proc/self/fd/0:/dev/stdin" \
    --bind="/proc/self/fd/1:/dev/stdout" \
    --bind="/proc/self/fd/2:/dev/stderr" \
    --bind=/sys \
    --bind="${INSTALL_DIR}/proc/.loadavg:/proc/loadavg" \
    --bind="${INSTALL_DIR}/proc/.stat:/proc/stat" \
    --bind="${INSTALL_DIR}/proc/.uptime:/proc/uptime" \
    --bind="${INSTALL_DIR}/proc/.version:/proc/version" \
    --bind="${INSTALL_DIR}/proc/.vmstat:/proc/vmstat" \
    --bind="${INSTALL_DIR}/root:/dev/shm" \
    /usr/bin/env -i \
    "HOME=/root" \
    "LANG=C.UTF-8" \
    "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    "TERM=xterm-color256" \
    "TMPDIR=/tmp" \
    /bin/ash -l
