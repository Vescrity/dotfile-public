# What the fxxk
#export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json
# set it in niri instead
#export VK_LOADER_DRIVERS_SELECT=intel_hasvk_icd.x86_64.json,intel_icd.x86_64.json
# unset all? maybe no need
#systemctl --user unset-environment $(systemctl --user show-environment| cut -d '=' -f 1)


# Use lxqt (no reason)
export XDG_MENU_PREFIX=lxqt-
export PATH="/home/$USER/.local/bin:$PATH"
# My scripts path
export PATH="/home/$USER/bin:$PATH"
export PATH="/home/$USER/bin/npsudo:$PATH"


# Create my tmp dirs
USER_TEMP_DIR="/tmp/$USER"

mkdir -p $USER_TEMP_DIR/cliphist
mkdir -p $USER_TEMP_DIR/Trash
mkdir -p $USER_TEMP_DIR/Downloads
mkdir -p $USER_TEMP_DIR/nt_data/nt_data
mkdir -p $USER_TEMP_DIR/wechat/xwechat
mkdir -p $USER_TEMP_DIR/mozilla
mkdir -p $USER_TEMP_DIR/Jiemeng
mkdir -p /run/user/$UID/wfrc


# Maybe use systemd instead, in future.
zrun_pid=$(pidof clash)
if [ -z "$zrun_pid" ]; then
	clash_start > /dev/null 2>&1 
fi


