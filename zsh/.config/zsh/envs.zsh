export GPG_TTY=$(tty)
export http_proxy="http://127.0.0.1:23579/"
export https_proxy="http://127.0.0.1:23579/"
export PROXY_PORT=23579
export VK_LOADER_DRIVERS_SELECT=intel_hasvk_icd.x86_64.json,intel_icd.x86_64.json
export VK_LOADER_DRIVERS_DISABLE=nouveau_icd.x86_64.json,nouveau_icd.i686.json

if [ ! -n "$TERM" ] || [ $TERM = linux ]; then
	export TERM=linux-16color
fi

