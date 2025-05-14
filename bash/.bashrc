[[ $- != *i* ]] && return

# HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

# ALIAS
alias grep='grep --color=auto'
alias nzf="fzf --preview='cat {}' | xargs -r nvim"
alias ff='fastfetch'
alias lg='lazygit'
alias so='source'
alias q='exit'
alias n='nvim'

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

PS1='[\u@\h \W]\$ '
eval "$(zoxide init --cmd cd bash)"

p() {
  krabby name --no-title --padding-left 2 "$@"
}

p-random() {
  krabby random --no-title --padding-left 2 "$@"
}

p-random
