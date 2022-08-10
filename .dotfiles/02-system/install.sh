#!/usr/bin/env bash
if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

#/bin/bash $HOME/.dotfiles/02-system/set-defaults.sh

if test ! $(which brew)
then
    echo "Homebrew could not be found"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

cd "$(dirname $0)"
if [[ -a "Brewfile" ]]
then
    brew bundle install -v
fi

sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
fish
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
eval "$(/opt/homebrew/bin/brew shellenv)"

[ ! -d "$HOME/.emacs.d" ] && git clone https://gitlab.com/jackatbancast/emacs.d.git $HOME/.emacs.d

if test ! $(which starship)
then	
    curl -sS https://starship.rs/install.sh | sh
fi
