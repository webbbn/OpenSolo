DESCRIPTION = "A UDP bridge over a wifibroadcast link"
HOMEPAGE = "https://github.com/OpenHD/wifibroadcast_bridge"
SECTION = "console/network"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"

DEPENDS = "libpcap boost"

SRCREV = "${AUTOREV}"
SRC_URI = "git://github.com/OpenHD/wifibroadcast_bridge.git;protocol=https"

S = "${WORKDIR}/git"

inherit pkgconfig cmake

do_install() {
    install -d ${D}${bindir}
    install -m 0755 wfb_bridge ${D}${bindir}
    install -d ${D}${libdir}
    install -m 0755 libwifibroadcast.so ${D}${libdir}
    install -d ${D}${sysconfdir}/default
    install -m 0644 conf/wfb_bridge ${D}${sysconfdir}/default
}
