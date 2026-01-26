#! /bin/sh

USER_DIR=$(cd ~ && pwd)

is_stow_installed() {
    pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
    echo "Install stow!"
    exit 1
fi

# Remove exisiting dotfiles
(
    cd $USER_DIR/.config
    rm -r hypr kitty mako spotify-player uwsm wallust waybar wofi yazi
)

# Symlink the repo configs via stow
(
    cd $USER_DIR/dotfiles &&
    stow hypr &&
    stow kitty &&
    stow mako &&
    stow helix &&
    stow spotify-player &&
    stow uwsm &&
    stow wallust &&
    stow waybar &&
    stow wofi &&
    stow starship &&
    stow yazi
)
