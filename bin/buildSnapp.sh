#!/usr/bin/env bash

# IMPORTANT 
# Protect agaisnt mispelling a var and rm -rf /
set -u
set -e

SRC=$(mktemp -t -d etherpad-snapp.XXXXXXXXX)
SYSROOT=${SRC}/sysroot
RUNTIME=${SRC}/runtime

rm -rf ${SRC}
rsync -a bin/snapp-src/ ${SRC}/

rsync --exclude '.git' -a . ${SYSROOT} --delete
rsync --exclude '.git' -a ../../runtime/node-v0.10.34-linux-x64/ ${RUNTIME} --delete
find ${SRC}/ -type d -exec chmod 0755 {} \;
find ${SRC}/ -type f -exec chmod go-w {} \;
fakeroot chown -R root:root ${SRC}/

snappy build ${SRC}

