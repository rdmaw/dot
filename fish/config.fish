source /usr/share/cachyos-fish-config/cachyos-config.fish
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_cursor_default block blink
set -g fish_cursor_insert block blink
set -g fish_cursor_replace underscore blink
set -g fish_cursor_visual block blink

zoxide init fish | source

# overwrite greeting
# function fish_greeting
  # smth smth
# end

alias q=exit
alias nv=nvim
alias lg=lazygit
