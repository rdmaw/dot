# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

# STYLES
export LS_COLORS="*.fi=37:di=38;2;156;177;216:*.lua=38;2;156;207;216:*.md=38;2;216;195;156:$LS_COLORS"

# ALIAS
alias ls='eza --icons=always --group-directories-first'
alias lsa='eza -a --icons=always --group-directories-first'
alias ls1='eza -1 --icons=always --group-directories-first'
alias ls1a='eza -1 -a --icons=always --group-directories-first'
alias ll='eza -lg --icons=always --group-directories-first'
alias lla='eza -lga --icons=always --group-directories-first'
alias lt='eza -T --icons=always --group-directories-first'
alias lt1='eza -Ta --level=1 --icons=always --group-directories-first'
alias lt2='eza -Ta --level=2 --icons=always --group-directories-first'
alias lt3='eza -Ta --level=3 --icons=always --group-directories-first'
alias ff='fastfetch'
alias lg='lazygit'
alias so='source'
alias q='exit'
alias n='nvim'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

# LOCALE
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# VIM
set -o vi

neofetch
