# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-plugins
#######################################
#               Pacman                #
#######################################

# Pacman - https://wiki.archlinux.org/index.php/Pacman_Tips
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacclean='sudo pacman -Sc'
alias pacinlocal='sudo pacman -U'
alias pacrmf='sudo pacman -Rns'
alias pacrm='sudo pacman -Rs'
alias pacremove='sudo pacman -R'
alias pacsch='pacman -Ss'
alias locsch='pacman -Qs'
alias pacown='pacman -Qo'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacinfo='pacman -Sii'
alias locinfo='pacman -Qii'

function pacclr() {
  sudo pacman -Sc
  sudo pacman -Rns $(pacman -Qtdq)
}
function paclist() {
  pacman -Qqe | xargs -I{} -P0 --no-run-if-empty pacman -Qs --color=auto "^{}\$"
}

function pacbin() {
  pacman -Ql $* | grep -E 'bin/.{1,}'
}
function pacdisowned() {
  local tmp_dir db fs
  tmp_dir=$(mktemp --directory)
  db=$tmp_dir/db
  fs=$tmp_dir/fs

  trap "rm -rf $tmp_dir" EXIT

  pacman -Qlq | sort -u > "$db"

  find /etc /usr ! -name lost+found \
    \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"

  rm -rf $tmp_dir
}

alias pacmanallkeys='sudo pacman-key --refresh-keys'

function pacmansignkeys() {
  local key
  for key in $@; do
    sudo pacman-key --recv-keys $key
    sudo pacman-key --lsign-key $key
    printf 'trust\n3\n' | sudo gpg --homedir /etc/pacman.d/gnupg \
      --no-permission-warning --command-fd 0 --edit-key $key
  done
}

if (( $+commands[xdg-open] )); then
  function pacweb() {
    if [[ $# = 0 || "$1" =~ '--help|-h' ]]; then
      local underline_color="\e[${color[underline]}m"
      echo "$0 - open the website of an ArchLinux package"
      echo
      echo "Usage:"
      echo "    $bold_color$0$reset_color ${underline_color}target${reset_color}"
      return 1
    fi

    local pkg="$1"
    local infos="$(LANG=C pacman -Si "$pkg")"
    if [[ -z "$infos" ]]; then
      return
    fi
    local repo="$(grep -m 1 '^Repo' <<< "$infos" | grep -oP '[^ ]+$')"
    local arch="$(grep -m 1 '^Arch' <<< "$infos" | grep -oP '[^ ]+$')"
    xdg-open "https://www.archlinux.org/packages/$repo/$arch/$pkg/" &>/dev/null
  }
fi

#######################################
#             AUR helpers             #
#######################################
alias yaupg='yay -Syu'
alias yain='yay --editmenu -S'
alias yaclean='yay -Sc'
alias yainlocal='yay -U'
function yaclr() {
  yay -Sc
  yay -Rsc $(yay -Qtdq)
}
alias yarm='yay -Rns'
alias yaremove='yay -R'
alias yasch='yay -Ss'
alias yainsd='yay -S --asdeps'
alias yamir='yay -Syy'
alias yalsorphans='yay -Qdt'
alias yaconf='yay -Pg'
alias yaorph='yay -Qtd'
alias yamir='yay -Syy'
alias yaupd="yay -Sy"
alias yainfo='yay -Sii'

# Check Arch Linux PGP Keyring before System Upgrade to prevent failure.
function upgrade() {

  MAX_DAYS=10
  MAX_TIME=$((MAX_DAYS * 86400))

  CACHE_FILE="$HOME/.cache/last_upgrade"

  if [ -f "$CACHE_FILE" ]; then
      LAST_RUN=$(cat "$CACHE_FILE")
      CURRENT_TIME=$(date +%s)
      LAST_RUN_TIME=$((CURRENT_TIME - LAST_RUN))
      if [ "$LAST_RUN_TIME" -lt "$MAX_TIME" ]; then
          echo "Last upgrade: $LAST_RUN_TIME seconds ago."
          echo "Expected: At least $MAX_TIME"
          return 1
      fi
  fi


  echo ":: Checking Arch Linux PGP Keyring..."
  local installedver="$(sudo pacman -Qi archlinux-keyring | head -n 2 | tail -n 1)"
  local currentver="$(sudo pacman -Si archlinux-keyring | head -n 3 | tail -n 1)"
  echo "Installed:  $installedver"
  echo "Latest:     $currentver"
  if [ $installedver != $currentver ]; then
    echo " Arch Linux PGP Keyring is out of date."
    echo " Updating before full system upgrade."
    sudo pacman -Sy --needed --noconfirm archlinux-keyring
  else
    echo " Arch Linux PGP Keyring is up to date."
    echo " Proceeding with full system upgrade."
  fi
  if (( $+commands[yay] )); then
    yay -Syu
  elif (( $+commands[trizen] )); then
    trizen -Syu
  elif (( $+commands[pacaur] )); then
    pacaur -Syu
  elif (( $+commands[aura] )); then
    sudo aura -Syu
  else
    sudo pacman -Syu
  fi
  # 记录本次执行时间
  if [ $? -eq 0 ]; then
      echo "$(date +%s)" > "$CACHE_FILE"
  fi
}
