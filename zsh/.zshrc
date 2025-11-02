# vim:fileencoding=utf-8:foldmethod=marker
#
# # README
#
# This ZSHRC source the zsh-syntax-highlighting and zsh-autosuggestions
# Check their installation path and change them at the end of this file.
#
# ## Config
#
# this file will source ~/.config/zsh/*.zsh by default
#
XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$UID/}"

# IMPORTANT: CHANGE TO OTHER TEMP PATH if you don't use LINUX
DIRSTACK="$XDG_RUNTIME_DIR/zsh/"
DIRSTACKFILE="$DIRSTACK/dirs"
mkdir -p "$DIRSTACK"

# BASIC_CONFIG {{{
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
# VI keybindings
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/${USER}/.zshrc'

autoload -Uz compinit && compinit
#autoload -Uz promptinit && promptinit

zstyle ':completion:*' menu select
# End of lines added by compinstall

zstyle ':completion:*' ignore-parents always
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

precmd() {
    print -Pn "\e]133;A\e\\"
}


setopt HIST_IGNORE_ALL_DUPS


if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] 
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=60

#setopt autopushd pushdsilent pushdtohome
setopt autopushd 
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

alias d='dirs -v'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias 10='cd -10'
alias 11='cd -11'
alias 12='cd -12'
alias 13='cd -13'
alias 14='cd -14'
alias 15='cd -15'
alias 16='cd -16'
alias 17='cd -17'
alias 18='cd -18'
alias 19='cd -19'
alias ...="cd ../.."
alias ....="cd ../../.."

for file in ~/.config/zsh/*.zsh; do
    source "$file"
done

# NEED_END
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# }}}

