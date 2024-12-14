pokemon-colorscripts -r --no-title

# SSH
eval "$(ssh-agent -s)" > /dev/null 2>&1 
ssh-add ~/.ssh/id_ed25519 2>/dev/null

# PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PLUGINS
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# SNIPPETS
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# COMPLETIONS
autoload -Uz compinit && compinit
zinit cdreplay -q

# OMP
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/redmaw.json')"

# KEYBINDS
bindkey -v

# HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_find_no_dups
setopt hist_verify
setopt NO_BEEP

# STYLES
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "eza --icons=always --group directories-first --color $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "eza --icons=always --group directories-first --color $realpath"
export LS_COLORS="*.fi=37:di=38;2;156;177;216:*.lua=38;2;156;207;216:*.md=38;2;216;195;156:$LS_COLORS"

# ALIAS
alias ls="eza --icons=always --group-directories-first"
alias ls1="eza -1 --icons=always --group-directories-first"
alias ll="eza -lg --icons=always --group-directories-first"
alias lla="eza -lga --icons=always --group-directories-first"
alias lt="eza -T --icons=always --group-directories-first"
alias lt1="eza -Ta --level=1 --icons=always --group-directories-first"
alias lt2="eza -Ta --level=2 --icons=always --group-directories-first"
alias lt3="eza -Ta --level=3 --icons=always --group-directories-first"
alias lg="lazygit"
alias so="source"
alias e="exit"; alias q="exit"
alias l="clear"; alias q="clear"
alias n="nvim"

# SHELL
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
