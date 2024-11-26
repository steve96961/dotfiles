#! /usr/bin/env bash

sudo pacman -Suy hyprland hyprlock tmux fish fuzzel grim slurp mako nemo swww waybar alacritty noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd ttf-firacode-nerd discord k9s kubectl helm code vim docker docker-buildx chromium fastfetch pipewire iw iwd go cliphist base-devel

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S bibata-cursor-theme catppuccin-gtk-theme-mocha wlogout errands
