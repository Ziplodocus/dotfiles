#! /bin/sh

# Sounds packages
sudo pacman -S --needed --noconfirm pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber


# Net TUI utils
sudo pacman -S --needed --noconfirm networkmanager


# Yay Pacman AUR helper setup
cd ~
sudo pacman -S --needed --noconfirm git base-devel

# If yay already exists, then pull the latest version
if [ -d yay ]; then
  cd "yay"
  git pull
elif;
  git clone https://aur.archlinux.org/yay.git
  cd "yay"
fi

sudo makepkg -si
