DESCRIPTION = "v4l2 to UDP multicast"
PR = "r0"
LICENSE = "CLOSED"
RM_WORK_EXCLUDE += "v4l2_to_udp"
DEPENDS += "libv4l"
PROVIDES = "v4l2udp"

SRC_URI = "file://v4l2_to_udp.cc \
          "
do_compile() {
    ${CXX} -std=c++11 ${CFLAGS} ${LDFLAGS} ${WORKDIR}/v4l2_to_udp.cc -o v4l2_to_udp -lv4l2
}

do_install() {
    install -m 0755 -d ${D}${bindir}
    install -m 0755 ${S}/v4l2_to_udp ${D}${bindir}
}
