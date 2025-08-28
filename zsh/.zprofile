#export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json
#export VK_LOADER_DRIVERS_SELECT=intel_hasvk_icd.x86_64.json,intel_icd.x86_64.json
systemctl --user unset-environment $(systemctl --user show-environment| cut -d '=' -f 1)
export GSK_RENDERER=ngl
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
export XDG_MENU_PREFIX=lxqt-
export PATH="/home/vescrity/.local/bin:$PATH"
export PATH="/home/vescrity/bin:$PATH"
export PATH="/home/vescrity/bin/npsudo:$PATH"
export http_proxy="http://127.0.0.1:7890/"
export https_proxy="http://127.0.0.1:7890/"
#unset QT_QPA_PLATFORMTHEME
export QT_QPA_PLATFORMTHEME=qt6ct
export EDITOR=vim
#/home/vescrity/bin/start_profile
#sudo win_automount > /dev/null 2>&1

USER_TEMP_DIR="/tmp/$USER"

mkdir -p $USER_TEMP_DIR/cliphist
mkdir -p $USER_TEMP_DIR/nt_data/nt_data
mkdir -p $USER_TEMP_DIR/wechat/xwechat
mkdir -p $USER_TEMP_DIR/mozilla
mkdir -p /run/user/1000/wfrc

zrun_pid=$(pidof clash)
if [ -z "$zrun_pid" ]; then
	clash_start > /dev/null 2>&1 
fi


