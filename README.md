# My Personal Arch Setup using Hyprland as tiling window compositor

## Screenshots

![image](https://github.com/user-attachments/assets/5ce493e3-2223-4b56-9d4e-52c1b52722c0)


## Get Started:

```bash
sudo pacman -Suy hyprland hyprlock tmux fish fuzzel grim slurp mako nemo swww waybar alacritty noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd ttf-firacode-nerd discord k9s kubectl helm code vim docker docker-buildx chromium fastfetch pipewire iw iwd go cliphist errands

# NVIDIA go brrt (change nvidia-lts to nvidia if using non lts kernel)
sudo pacman -S nvidia-lts nvidia-settings nvidia-utils lib32-nvidia-utils lib32-opencl-nvidia opencl-nvidia libvdpau lib32-libvdpau libxnvctrl vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d opencl-headers opencl-clhpp vulkan-validation-layers lib32-vulkan-validation-layers

#AUR
yay -S bibata-cursor-theme catppuccin-gtk-theme-mocha wlogout
```

Tips:

- Change Ozone Layer in Chrome to Wayland
