# My Personal Arch Setup using Hyprland as tiling window compositor
# Get Started:

```
sudo pacman -Suy hyprland tmux fish fuzzel grim slurp mako nemo hyprpaper waybar alacritty noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd ttf-firacode-nerd discord k9s kubectl helm code vim docker docker-buildx chromium fastfetch pipewire iw iwd go mpvpaper

# NVIDIA go brrt (change nvidia-lts to nvidia if using non lts kernel)
sudo pacman -S nvidia-lts nvidia-settings nvidia-utils lib32-nvidia-utils lib32-opencl-nvidia opencl-nvidia libvdpau lib32-libvdpau libxnvctrl vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d opencl-headers opencl-clhpp vulkan-validation-layers lib32-vulkan-validation-layers

#AUR
yay -S bibata-cursor-theme catppuccin-gtk-theme-mocha
```

Tips:

- Change Ozone Layer in Chrome to Wayland
