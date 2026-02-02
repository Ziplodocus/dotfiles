#! /bin/sh

readonly CURRENT_DIR="$(pwd)"
readonly SELF_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$SELF_DIR" || (echo "Couldn't change directory 🤔" && exit);

. ./install-core-packages.sh
. ./install-hyprland.sh
. ./install-kitty.sh
. ./install-helix.sh
. ./install-waybar.sh
. ./install-blueman.sh
. ./install-mako.sh
. ./install-wofi.sh
. ./install-yazi.sh
. ./install-zoxide.sh
. ./install-spotify-player.sh
. ./install-starship.sh
. ./install-stow.sh

. ./install-firacode-nerd-font.sh

. ./install-dotfiles.sh

cd "$CURRENT_DIR" || exit;
