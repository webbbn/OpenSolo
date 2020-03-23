DESCRIPTION = "Simple UART/UDP Bridge for MAVLink"
HOMEPAGE = "https://github.com/dogmaphobic/MAVLinkBridge"
SECTION = "console/network"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://README.md;md5=055015938bb4f733243cabe10f3429f4"

SRCREV = "${AUTOREV}"
SRC_URI = "gitsm://git@github.com/webbbn/MAVLinkBridge.git;protocol=https \
	   file://start_mavlinkbridge.sh"

S = "${WORKDIR}/git"

inherit pkgconfig cmake

do_install() {
    install -d ${D}${bindir}
    install -m 0755 mavlinkbridge ${D}${bindir}
    install -m 0755 ${WORKDIR}/start_mavlinkbridge.sh ${D}${bindir}
}
