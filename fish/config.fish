fish_add_path ~/.local/bin ~/.cargo/bin
set -gx npm_config_prefix "$HOME/.local"

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

function history
    builtin history --show-time='%F %T ' $argv
end

function backup --argument filename
    cp $filename $filename.bak
end

function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

set -g fish_key_bindings fish_vi_key_bindings
set -g fish_cursor_default block blink
set -g fish_cursor_insert block blink
set -g fish_cursor_replace underscore blink
set -g fish_cursor_visual block blink

zoxide init fish | source

alias q=exit
alias nv=nvim
alias lg=lazygit
alias lcss=lightningcss
alias ls='eza -al --color=always --group-directories-first --icons=always'
alias la='eza -a --color=always --group-directories-first --icons=always'
alias ll='eza -l --color=always --group-directories-first --icons=always'
alias lt='eza -aT --color=always --group-directories-first --icons=always'
alias l.="eza -a | grep -e '^\.'"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
