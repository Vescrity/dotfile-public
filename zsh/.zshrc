# vim:fileencoding=utf-8:foldmethod=marker
# BASIC_CONFIG {{{
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/${USER}/.zshrc'

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
# End of lines added by compinstall
zstyle ':completion:*' ignore-parents always
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

PROMPT="
%B%F{cyan}%n%f@%F{magenta}%m%f %F{green}%~%b%f
> "
RPROMPT="%B%K{blue}J%k %j  %K{red}E%k %?  %F{green}%*%f %F{yellow}%D{%Y-%m-%d}%f%b"


setopt HIST_IGNORE_ALL_DUPS

XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$UID/}"
DIRSTACK="$XDG_RUNTIME_DIR/zsh/"
DIRSTACKFILE="$DIRSTACK/dirs"
mkdir -p "$DIRSTACK"

if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] 
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

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

# }}}

alias ip='ip --color=auto'
alias ls='ls --color=auto --hyperlink'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias u="echo use user: pkgmake"
alias f="fastfetch"
alias c="clear"
alias v="nvim"
alias o="okular"
alias zmux="zellij"
alias l="eza -aaglh --hyperlink"
alias ll="eza -glh --hyperlink"
alias view="vim -R"
alias yay="yay --editmenu"
alias ac311venv="source ~/.venv311/bin/activate"
alias pacf="pacfiles"
alias rm="echo NOOOOOOOOOOOOOOOOOOOOOO; false" 
alias /bin/rm="echo Use trash; false" 
alias uget="you-get" 
alias fd="fd --no-ignore-vcs"
alias bat="bat --wrap=never"
alias ta="tmux a -t"
alias sstat="systemctl --user status"
alias susp="systemctl --user freeze"
alias cont="systemctl --user thaw"

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=60
GPG_TTY=$(tty)
http_proxy="http://127.0.0.1:7890/"
https_proxy="http://127.0.0.1:7890/"



if [ ! -n "$TERM" ] || [ $TERM = linux ]; then
	export TERM=linux-16color
fi

#umask 0022
# NEED_END
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
