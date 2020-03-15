require wifibroadcast-bridge.inc

PN="wifibroadcast-bridge"

SRC_URI += "file://disable-python.patch \
            file://wfb_bridge.conf \
           "

SRC_URI[md5sum] = "d276ed5995c017a4d724866897cf3643"
SRC_URI[sha256sum] = "9877a7a62c20b8dcc22b4f60bae5868e93e6c2e20edf00f008fe692a4e93d597"

do_deploy_append () {
    install -d ${DEPLOY_DIR_IMAGE}/etc/default
    install -m -644 ${WORKDIR}/wfb_bridge.conf ${DEPLOY_DIR_IMAGE}/etc/default/wfb_bridge
}
