# dwm-gab

This is my customized version of **dwm**, the minimalistic window manager from [suckless.org](https://suckless.org). Based on the upstream source, it has been heavily tweaked for enhanced functionality. Once compiled, the tiny binary can run on virtually any UNIX-like system supporting the X protocol.

## Installation (Step By Step)

Before installing, make sure you have all the dependencies installed. You can search for the equivalents if you don't use `pacman`.

### Dependency List (Arch Linux / Pacman)

```
sudo pacman -S --noconfirm --needed \
  base-devel git xorg-server xorg-xrandr xorg-xset xclip \
  alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber \
  noto-fonts noto-fonts-emoji ttf-meslo-nerd \
  papirus-icon-theme nwg-look lxappearance \
  sddm alacritty rofi polybar thunar gvfs dunst feh flameshot picom mate-polkit pavucontrol
```

### Compile DWM

```
mkdir -p ~/.local/bin ~/.local/share ~/.config ~/Pictures/screenshots
git clone https://github.com/dallagnoli/dwm-gab ~/.local/share/dwm-gab
cd ~/.local/share/dwm-gab
sudo make clean install
```

### Copy Config Files

```
cp -r ~/.local/share/dwm-gab/scripts/* ~/.local/bin
cp -r ~/.local/share/dwm-gab/config/* ~/.config
```

### Clone Backgrounds

```
git clone https://github.com/dallagnoli/backgrounds ~/Pictures/backgrounds
```

### Enable Display Manager

```
sudo mkdir -p /usr/share/xsessions
sudo cp ~/.local/share/dwm-gab/dwm.desktop /usr/share/xsessions
sudo systemctl enable sddm
```

Reboot your system, select `dwm` from the SDDM login screen, and log in.

## Tips

- Check the keybindings in `config.h` and adjust them to your liking.
- If you modify `config.h`, recompile DWM with `sudo make clean install`.
- Ensure `~/.local/bin` is in your shell `PATH`.
- Update the resolution script to match your monitor setup.
- The webapp script allows you to create and launch isolated web applications in Chromium.
