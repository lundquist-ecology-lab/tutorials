#!/bin/sh

# install dependencies
yay -S cmake gcc-fortran

# install applications
yay -S neovim  kitty  libreoffice-fresh r python3 python-pip obsidian lazygit cider zoom hunspell evolution evolution-ews nodejs ttf-fira-sans brave-bin zsh rclone chrome-gnome-shell-git mariadb rstudio-desktop-bin yarn refind-efi rpi-imager steam vlc realvnc-vnc-viewer ranger gamemode nautilus-admin blueberry qgis darktable

yay -S hunspell-en_us


mkdir ~/mnt
mkdir ~/mnt/drive
mkdir ~/mnt/box

rclone config # Run this to set up Google Drive and Box

sudo nvim /etc/fuse.conf 
# uncomment user_allow_other

systemctl --user daemon-reload
systemctl --user enable rclone@drive
systemctl --user start rclone@drive
systemctl --user enable rclone@box
systemctl --user start rclone@box

# Set up bluetooth
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

## zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Edit nvim.desktop
sudo nvim /usr/share/applications/nvim.desktop

## Download Tela icons
cd /tmp
git clone https://github.com/vinceliuice/Tela-icon-theme
cd Tela*
./install.sh -a

# Open any terminal (kitty) in nautilus
yay -S nautilus-open-any-terminal

gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
