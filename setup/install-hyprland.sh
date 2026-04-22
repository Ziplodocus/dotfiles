#! /bin/sh

# Hypr ecosystem packages
sudo pacman -S --needed --noconfirm hyprland hypridle hyprlock hyprpaper hyprshot hyprcursor hyprgraphics hyprland-guiutils hyprpolkitagent hyprtoolkit hyprutils hyprwire xdg-desktop-portal-hyprland

# Additional AUR utils
yay -S --needed --noconfirm hyprshutdown

# QT wayland support
sudo pacman -S --needed --noconfirm qt5-wayland qt6-wayland

# Universal Wayland Session Manager (Used to launch Hyprland and many other apps)
sudo pacman -S --needed --noconfirm uwsm libnewt

