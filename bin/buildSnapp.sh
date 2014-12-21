#!/usr/bin/env bash

# IMPORTANT 
# Protect agaisnt mispelling a var and rm -rf /
set -u
set -e

BUILDDIR=build

rm -rf ${BUILDDIR}

snapp-sourcery setup ${BUILDDIR} bin/snapp-src
. snapp-sourcery env ${BUILDDIR}

snapp-sourcery addruntime node_v0.10.34-linux-x64 node
. snapp-sourcery env ${BUILDDIR}

[ ! -d "${BUILDDIR}" ] && mkdir -p ${BUILDDIR}/pkg

PATH=$PATH:$PWD/$NODE_PATH/bin
export PATH

echo path: $PATH

./bin/installDeps.sh

rsync --exclude '.git' --exclude 'build/' -a . ${BUILDDIR}/pkg --delete

find ${BUILDDIR}/ -type d -exec chmod 0755 {} \;
find ${BUILDDIR}/ -type f -exec chmod go-w {} \;
fakeroot chown -R root:root ${BUILDDIR}/pkg

snappy build ${BUILDDIR}
