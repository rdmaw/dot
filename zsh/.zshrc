
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# SSH
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add ~/.ssh/id_ed25519 2>/dev/null

# PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export HOMEBREW_NO_ANALYTICS=1
export PATH="$PATH:/mnt/c/'Program Files'/WezTerm.exe"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# PLUGINS
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# COMPLETIONS
autoload -Uz compinit && compinit
zinit cdreplay -q

# OMP
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/redmaw.json')"

# ZOXIDE
eval "$(zoxide init --cmd cd zsh)"

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
export LS_COLORS="*.fi=37:di=38;2;156;177;216:*.lua=38;2;156;207;216:*.md=38;2;216;195;156:$LS_COLORS"

# ALIAS
alias ls="eza --icons=always --group-directories-first"
alias lsa="eza -a --icons=always --group-directories-first"
alias ls1="eza -1 --icons=always --group-directories-first"
alias ls1a="eza -1 -a --icons=always --group-directories-first"
alias ll="eza -lg --icons=always --group-directories-first"
alias lla="eza -lga --icons=always --group-directories-first"
alias lt="eza -T --icons=always --group-directories-first"
alias lt1="eza -Ta --level=1 --icons=always --group-directories-first"
alias lt2="eza -Ta --level=2 --icons=always --group-directories-first"
alias lt3="eza -Ta --level=3 --icons=always --group-directories-first"
alias ff="fastfetch"
alias lg="lazygit"
alias so="source"
alias e="exit"; alias q="exit"
alias c="clear"; alias cl="clear"; 
alias n="nvim"
alias p="pokemon-colorscripts --no-title -n"
alias wez="wezterm.exe"
