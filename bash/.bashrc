# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History config
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

# Alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias so='source'
alias n='nvim'
alias lg='lazygit'
alias ff='fastfetch'
alias q='exit'

PS1='[\u@\h \W]\$ '

# Locale
# export LANGUAGE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8

# Vim binding
set -o vi
