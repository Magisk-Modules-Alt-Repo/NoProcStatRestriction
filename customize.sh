VERSION=$(grep_prop version "${TMPDIR}/module.prop" | tr -d '\n')
ui_print "- Android API level ${API}"
ui_print "- Magisk version ${MAGISK_VER}"
ui_print "- Module version ${VERSION}"
if [ $API -lt 26 ]; then
# version < 8, no need to install
	abort "! No restriction in current Android version!"
fi
