#!/usr/bin/env bash

sudo pacman -Suy --needed hyprland hyprlock tmux fish fuzzel grim slurp mako nemo swww waybar alacritty noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-font-awesome nwg-look k9s kubectl helm code vim docker docker-buildx chromium fastfetch pipewire iw iwd go cliphist base-devel less btop libimobiledevice usbmuxd dolphin-emu wine lutris openvpn 7zip steam

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

yay -S bibata-cursor-theme catppuccin-gtk-theme-mocha wlogout errands obs-studio-browser ultrastardx-git

cp -r .config .wallpapers .vimrc ~/.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
