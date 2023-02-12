#! /system/bin/sh
# termdo install
BASE_DIR="/data/data/com.termdo/files"
INSTALL_DIR="${BASE_DIR}/termdo_alpine"
PROOT="proot-v5.3.0-aarch64-static"

MIRROR="http://mirrors.tuna.tsinghua.edu.cn/alpine"
BRANCH="v3.17"

mkdir ${INSTALL_DIR}
tar -xzf ${BASE_DIR}/alpine* -C ${INSTALL_DIR}
rm -rf ${BASE_DIR}/alpine*

echo "${MIRROR}/${BRANCH}/main\n${MIRROR}/${BRANCH}/community" >${INSTALL_DIR}/etc/apk/repositories
echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8" >${INSTALL_DIR}/etc/resolv.conf

# setup proc
mv ${BASE_DIR}/proc ${INSTALL_DIR} -f
chmod 777 ${INSTALL_DIR}/proc

rm -rf ${BASE_DIR}/proc
rm -rf ${BASE_DIR}/install.sh
rm -rf ${BASE_DIR}/termdo_alpine.zip

chmod 777 ${BASE_DIR}/${PROOT}
chmod +x ${BASE_DIR}/start.sh
cd ${BASE_DIR}
./start.sh
