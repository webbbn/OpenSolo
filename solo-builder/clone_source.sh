#!/bin/bash

#  Create the build directory and make sure we own it.
SOLO_BUILDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BUILD_ROOT=`dirname ${SOLO_BUILDER}`
BUILD_DIR=${BUILD_ROOT}/solo-build
SOURCE_DIR=${BUILD_DIR}/sources
mkdir -p ${SOURCE_DIR}
mkdir -p ${BUILD_DIR}/build

clone_dir () {
    REPO=$1
    HASH=$2
    SDIR=$3
    git clone ${REPO} ${SOURCE_DIR}/${SDIR}
    (
        cd ${SOURCE_DIR}/${SDIR}
        git checkout -b current ${HASH}
    )
}

git submodule update --init

clone_dir git://git.yoctoproject.org/poky bee7e3756adf70edaeabe9d43166707aab84f581 poky
clone_dir git://git.yoctoproject.org/meta-fsl-arm af392c22bf6b563525ede4a81b6755ff1dd2c1c6 meta-fsl-arm
clone_dir git://git.openembedded.org/meta-openembedded eb4563b83be0a57ede4269ab19688af6baa62cd2 meta-openembedded
clone_dir git://github.com/Freescale/meta-fsl-arm-extra 07ad83db0fb67c5023bd627a61efb7f474c52622 meta-fsl-arm-extra
clone_dir git://github.com/Freescale/meta-fsl-demos 5a12677ad000a926d23c444266722a778ea228a7 meta-fsl-demos
clone_dir git://github.com/OSSystems/meta-browser fc3969f63bda343c38c40a23f746c560c4735f3e meta-browser
clone_dir git://github.com/opensolo/meta-fsl-bsp-release origin/dora_3.10.17-1.0.0_GA meta-fsl-bsp-release

(
    cd ${SOURCE_DIR}
    ln -s ../../solo-builder/3dr-yocto-bsp-base base
    ln -s ../../meta-3dr meta-3dr
)

cp ${BUILD_ROOT}/solo-builder/3dr-yocto-bsp-base/README.md ${BUILD_DIR}
cp ${BUILD_ROOT}/solo-builder/3dr-yocto-bsp-base/setup-environment ${BUILD_DIR}
cp -f ${BUILD_ROOT}/solo-builder/gtk-doc-stub_git.bb ${SOURCE_DIR}/poky/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
cp ${SOURCE_DIR}/meta-fsl-bsp-release/imx/tools/fsl-setup-release.sh ${BUILD_DIR}
