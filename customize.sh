VERSION=$(grep_prop version "${TMPDIR}/module.prop" | tr -d '\n')
ui_print "- Android API level ${API}"
ui_print "- Magisk version ${MAGISK_VER}"
ui_print "- Module version ${VERSION}"
TARGET_STRING="untrusted_app untrusted_app_25"
if [ $API -lt 26 ]; then
# version < 8, no need to install
	abort "! No restriction in current Android version!"
fi
if [ $API -ge 28 ]; then
# version >=9, new SELinux domain untrusted_app_27 added
# http://aospxref.com/android-9.0.0_r61/search?full=untrusted_app_27&defs=&refs=&path=&hist=&type=&xrd=&nn=25&searchall=true
	ui_print "- Adding extra rule for high Android version..."
	TARGET_STRING="${TARGET_STRING} untrusted_app_27"
fi
RULE_STRING="allow { ${TARGET_STRING} } proc_stat file { open read getattr }"
ui_print "- Rule string:"
ui_print "${RULE_STRING}"
echo "${RULE_STRING}" > "${MODPATH}/sepolicy.rule"
set_perm_recursive "${MODPATH}" 0 0 0755 0644
ui_print "- Done."
