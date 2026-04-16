#!/bin/sh -e

sudo pacman -S --noconfirm --needed \
  base-devel git rsync xorg-server xorg-xrandr xorg-xset \
  noto-fonts noto-fonts-emoji ttf-meslo-nerd \
  papirus-icon-theme \
  pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber \
  sddm alacritty rofi polybar thunar gvfs dunst feh flameshot picom mate-polkit pavucontrol

mkdir -p ~/.local/bin ~/.config ~/Pictures/screenshots

rsync -a config/ ~/.config/
rsync -a scripts/ ~/.local/bin/
[ -d ~/.local/bin ] && chmod +x ~/.local/bin/*

[ ! -d ~/Pictures/backgrounds ] && \
git clone https://github.com/dallagnoli/backgrounds ~/Pictures/backgrounds

[ -f Makefile ] || { echo "Run inside dwm source dir"; exit 1; }
sudo make clean install

sudo mkdir -p /usr/share/xsessions
[ -f dwm.desktop ] && sudo cp dwm.desktop /usr/share/xsessions

sudo systemctl enable --now sddm
