#!/usr/bin/fish

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set to_be_added /opt/homebrew/bin
for custom_path in $to_be_added
    if not contains $custom_path $fish_user_paths
        set -U fish_user_paths $custom_path $fish_user_paths
    end
end

if test -e $HOME/.config/local.fish
  source $HOME/.config/local.fish
end

starship init fish | source
source /opt/homebrew/opt/asdf/libexec/asdf.fish

set -U FZF_COMPLETE 1
