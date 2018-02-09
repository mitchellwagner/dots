# ~/.bashrc: executed for non-login shells.

# If not running interactively, just export PATH
#PATH=.:$HOME/bin:$PATH

export PATH=~Jing.Liu/bin:$PATH

#This is used to make the prompt line look nice
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
#---------------------------------------------

#To enable ROOT using a more up to date version.
export ROOTSYS=~Jing.Liu/src/root5.34.36/
export PATH=$ROOTSYS/bin:$PATH
export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
#---------------------------------------------




[ -z "$PS1" ] && return

stty -ixon # disable C-q C-s

# don't put duplicate lines or lines starting with space in the history,
# and erase already existing duplicated lines
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="[ ]*:&:l[lsa]:[bf]g:exit"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar # not work in old bash

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
else
  color_prompt=
fi

# Define colors
red="\[\e[0;31m\]"
RED="\[\e[1;31m\]"
green="\[\e[0;32m\]"
GREEN="\[\e[1;32m\]"
yellow="\[\e[0;33m\]"
YELLOW="\[\e[1;33m\]"
blue="\[\e[0;34m\]"
BLUE="\[\e[1;34m\]"
magenta="\[\e[0;35m\]"
MAGENTA="\[\e[1;35m\]"
cyan="\[\e[0;36m\]"
CYAN="\[\e[1;36m\]"
PLAIN="\[\e[0m\]"



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

# some more ls aliases
alias ll='ls -AlFh'
alias la='ls -Ah'

alias df='df -h'
alias du='du -h'

alias micro='TERM=xterm-256color micro'
alias ev='emacs -nw'

alias r='root -l'
alias rbq='root -b -q'

alias news='newsbeuter -q'


export WWW_HOME=~/.w3m/bookmark.html
export LYNX_CFG=~/.lynx/lynx.cfg
export LYNX_LSS=~/.lynx/lynx.lss

export LC_ALL="en_US.UTF-8"

export TEXMFHOME=~/.texmf

#export LD_LIBRARY_PATH=Jing.Liu/lib:$PATH

export MANPATH=~/man:$MANPATH

export EDITOR='vim -X'
alias vi='vim -X'
export PAGER='less'
export ROVER_OPEN='open'
l () {
  tempfile=$(mktemp 2> /dev/null)
  rover --save-cwd "$tempfile" "$PWD" ~/Dropbox ~/github ~/overleaf ~/rdlab
  cd "$(cat $tempfile)"
  rm -f $tempfile
}

export ROVER_SHELL='rosh'

