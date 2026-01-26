#! /bin/sh

readonly CURRENT_DIR=$(pwd)
readonly SELF_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $SELF_DIR;

. ./install-hyprland.sh
. ./install-waybar.sh
. ./install-mako.sh
. ./install-wofi.sh
. ./install-yazi.sh
. ./install-zoxide.sh
. ./install-spotify-player.sh
. ./install-starship.sh
. ./install-stow.sh

. ./install-dotfiles.sh

cd $CURRENT_DIR;
