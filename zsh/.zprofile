# What the fxxk
#export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json
# set it in niri instead
#export VK_LOADER_DRIVERS_SELECT=intel_hasvk_icd.x86_64.json,intel_icd.x86_64.json


# Use lxqt (no reason)
export XDG_MENU_PREFIX=lxqt-
export PATH="$HOME/.local/bin:$PATH"
# My scripts path
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/npsudo:$PATH"

#export http_proxy="http://127.0.0.1:23579/"
#export https_proxy="http://127.0.0.1:23579/"
export PROXY_PORT=23579
export VK_LOADER_DRIVERS_SELECT=intel_hasvk_icd.x86_64.json,intel_icd.x86_64.json
export VK_LOADER_DRIVERS_DISABLE=nouveau_icd.x86_64.json,nouveau_icd.i686.json

# Never use it.
#systemctl --user import-environment

# Create my tmp dirs
USER_TEMP_DIR="/tmp/vescrity"

mkdir -p $USER_TEMP_DIR/cliphist
mkdir -p $USER_TEMP_DIR/Trash
mkdir -p $USER_TEMP_DIR/Downloads
mkdir -p $USER_TEMP_DIR/mozilla
mkdir -p $USER_TEMP_DIR/Jiemeng
mkdir -p $USER_TEMP_DIR/NPC/logs
mkdir -p $USER_TEMP_DIR/NEMU


# Maybe use systemd instead, in future.
#zrun_pid=$(pidof mihomo)
#if [ -z "$zrun_pid" ]; then
#	clash_start > /dev/null 2>&1 
#fi


