source /usr/share/cachyos-fish-config/cachyos-config.fish
set -g fish_key_bindings fish_vi_key_bindings

zoxide init fish | source

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

alias q=exit
alias lg=lazygit
