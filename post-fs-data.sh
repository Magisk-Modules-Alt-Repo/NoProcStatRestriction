# code from https://github.com/Magisk-Modules-Alt-Repo/submission/issues/145#issuecomment-1380050014
M=$(magisk --path) || M=/sbin
MODDIR="${0%/*}"
MODNAME="${MODDIR##*/}"
SE="$M/.magisk/mirror/sepolicy.rules/$MODNAME/sepolicy.rule"
if [ ! -f "$SE" ]; then
  # copy and live patch sepolicy
  magiskpolicy --live --apply "$MODDIR/sepolicy.rule"
  rm -rf "${SE%/*}"
  mkdir "${SE%/*}"
  cp -af "$MODDIR/sepolicy.rule" "$SE"
fi