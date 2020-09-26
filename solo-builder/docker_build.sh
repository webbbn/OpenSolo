#!/bin/bash

SOLO_BUILDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BUILD_ROOT=`dirname ${SOLO_BUILDER}`

docker run -it --rm --volume ${BUILD_ROOT}:/vagrant 3drobotics/solo-builder /bin/bash -c "MACHINE=imx6solo-3dr-1080p EULA=1 source ./setup-environment build && bitbake -f 3dr-solo | tee solo-build.log && bitbake -f 3dr-controller | tee controller-build.log"
