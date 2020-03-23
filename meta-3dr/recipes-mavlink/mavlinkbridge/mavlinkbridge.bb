require mavlinkbridge.inc

PN="mavlinkbridge"

do_deploy_append () {
    install -d ${DEPLOY_DIR_IMAGE}/etc/default
    install -m -644 ${WORKDIR}/wfb_bridge.conf ${DEPLOY_DIR_IMAGE}/etc/default/wfb_bridge
}
