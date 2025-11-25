# $Id: .bashrc,v 1.24 2025/06/27 07:41:49 user Exp $
#
# ~/.bashrc ubuntu

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# Default -> HISTCONTROL=ignoreboth
#
HISTCONTROL=ignoredups:ignorespace:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

## Not in 18.04 default .bashrc, but 14.04 - yes
## "cd"  spellcheck auto correction
## shopt -s cdspell
##
## save each line of a multi-line command in the same history entry
## shopt -s cmdhist
## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# --- histsize default HISTSIZE=1000 HISTFILESIZE=2000
#
HISTSIZE=1024
HISTFILESIZE=4096

# HISTIGNORE="ls:pwd:fg:bg:exit:mc:top:ci:co:mc:screen:byobu:sumc:upd:upgr:upgr-dist:autoremove:du:h:halt:reboot:w"
HISTIGNORE="ls:pwd:fg:bg:exit:mc:top:htop"

# ---  locale
#
# russian system locale
# LANG=ru_RU.UTF-8
#
# english system locale
# LANG=en_US.UTF-8
#
# LANGUAGE="ru_RU:ru:en_US:en"

# --- UTF-8 lines
export NCURSES_NO_UTF8_ACS=1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# --- colors
#
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
GRAY="\[\033[0;38m\]"
LIGHTGRAY="\[\033[0;37m\]"
DARKGRAY="\[\033[1;30m\]"
LIGHTBLUE="\[\033[1;34m\]"
LIGHTGREEN="\[\033[1;32m\]"
LIGHTCYAN="\[\033[1;36m\]"
LIGHTRED="\[\033[1;31m\]"
LIGHTPURPLE="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
DEFAULT="\[\033[0m\]"

# --- bash prompt examples
#
# PS1="[\u@\h]$ "
# PS1="{\w}\n[\u@\h]$ "
# PS1="[\u@\h:\W] "
#
# PS1="{$LIGHTBLUE\w$DEFAULT}\n[\u@\h]$ "
# PS1="$GRAY[$CYAN\u$RED@$CYAN\h$RED:$GREEN\W$GRAY]$DEFAULT "
# PS1="{$LIGHTBLUE\w$DEFAULT}\n$GRAY[$CYAN\u$RED@$CYAN\h$RED:$GREEN\W$GRAY]$DEFAULT "
#
# if [ $UID == 0 ]; then
#    PS1="{$LIGHTBLUE\w$DEFAULT}\n$GRAY[$RED\u@\h:$GREEN\W$GRAY]$DEFAULT "
# else
#    PS1="{$LIGHTBLUE\w$DEFAULT}\n$GRAY[$CYAN\u@\h:$GREEN\W$GRAY]$DEFAULT "
# fi
#
if [ $UID == 0 ]; then
    # PS1="{$LIGHTBLUE\w$DEFAULT}\n[$LIGHTRED\u@\h:$GREEN\W$DEFAULT] "
    # PS1="{$PURPLE\w$DEFAULT}\n[$LIGHTRED\u$CYAN@$GREEN\h$DEFAULT:$LIGHTPURPLE\W$DEFAULT] "
    PS1="{$PURPLE\w$DEFAULT}\n[$LIGHTRED\u$CYAN@$GREEN\h$DEFAULT:$BLUE\W$DEFAULT] "
else
    # PS1="{$LIGHTBLUE\w$DEFAULT}\n[$CYAN\u@\h:$GREEN\W$DEFAULT] "
    # PS1="{$PURPLE\w$DEFAULT}\n[$CYAN\u@$GREEN\h$DEFAULT:$LIGHTPURPLE\W$DEFAULT] "
    PS1="{$PURPLE\w$DEFAULT}\n[$CYAN\u@$GREEN\h$DEFAULT:$BLUE\W$DEFAULT] "
fi

PS1="{$PURPLE\w$DEFAULT}\n[$CYAN\u@$GREEN\h$DEFAULT:$BLUE\W$DEFAULT] "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Use alias with sudo
#sudo() {
#    if alias "$1" &> /dev/null ; then 
#        $(type "$1" | sed -E 's/^.*`(.*).$/\1/') "${@:2}"
#    else
#        command sudo "$@"
#    fi
#}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# --- custom functions

# markdown view
$
mdr() { pandoc "$1" | lynx -stdin; }

# gitprompt ~/.bashrc
# > git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
#
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi
