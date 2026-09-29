#! /bin/sh

USER_DIR=$(cd ~ && pwd)

is_stow_installed() {
    pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
    echo "Install stow!"
    exit 1
fi

# Setup dirs for bash function includes
setup_bash_dirs() {
    cd $USER_DIR

    if [ ! -d ".bash_functions.d"] then
        mkdir .bash_fuctions.d
    fi
    if [ ! -f ".bash_functions"] then
        cd $USER_DIR;

        <<SH_FUNCS
        #! /bin/sh
        source ./.bash_functions.d/*
        SH_FUNCS >> .bash_functions
    fi

    if [ ! -d ".bash_aliases.d"] then
        mkdir .bash_aliases.d
    fi
    if [ ! -f ".bash_aliases"] then
        cd $USER_DIR;

        <<SH_FUNCS
        #! /bin/sh
        source ./.bash_aliases.d/*
        SH_FUNCS >> .bash_aliases
    fi   
}

# Remove exisiting dotfiles
(
    cd "$USER_DIR/.config" || exit
    rm -r helix hypr kitty mako spotify-player starship.toml \
    uwsm wallust waybar wofi xdg-desktop-portal \
    xdg-terminals.list yazi
)

# Symlink the repo configs via stow
(
    cd "$USER_DIR/dotfiles" &&
    stow helix &&
    stow hypr &&
    stow kitty && 
    stow mako &&
    stow spotify-player &&
    stow starship &&
    stow uwsm &&
    stow wallust &&
    stow waybar &&
    stow wofi && 
    stow xdg-desktop-portal
    stow yazi &&
)
