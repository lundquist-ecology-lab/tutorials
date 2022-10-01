## My initial application installation script (using yay)

These are a few program and setting that I use for fresh EndeavourOS installations. 
These can easily be used for other operating systems by changing the install command 
(e.g. **apt-get** in Ubuntu or Debian or **dnf** in Fedora) and checking 
the names of programs as they may be listed under slightly different names in
your OS's repositories. 

OS: EndeavourOS 

```shell
yay -S cmake gcc-fortran

## Some of these are Gnome specific
yay -S neovim \
       kitty \
       libreoffice-fresh \
       r \
       python3 \
       python-pip \
       gnome-tweaks \
       obsidian \
       lazygit \
       hunspell \ 
       evolution \
       evolution-ews \ 
       nodejs \
       ttf-fira-sans \ 
       zsh \
       rclone \ 
       mariadb \ 
       rstudio-desktop-bin \
       yarn \
       rpi-imager \
       vlc \ 
       ranger \
       nomachine \ 
       nautlius-admin \

yay -S hunspell-en_us

```

## Theming 

[Gnome extensions](https://extensions.gnome.org/)
  1. user theme
  2. just perfection
  3. impatience
  4. caffeine
  5. blur my shell

Gnome tweaks `modify window buttons`

Themes
1. Graphite GTK

```shell
cd /tmp
git clone https://github.com/vinceliuice/Graphite-gtk-theme
cd Graph*
./install.sh --tweaks rimless normal darker
```
Make sure to switch to dark theme in Gnome
2. Tela icon theme
```shell
cd /tmp
git clone https://github.com/vinceliuice/Tela-icon-theme
cd Tela*
./install.sh -a
```
This installs all color variations, pick both theme and icons using `Tweak Tools`

## Zsh

Install [oh-my-zsh](https://ohmyz.sh/)

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

I personally use zsh theme `agnoster`

## Data analysis stuff

R packages to install

```r
x <- c(
  "knitr",
  "plyr",
  "Hmisc",
  "Rmisc",
  "ggplot2",
  "expandFunctions",
  "lme4",
  "vegan",
  "BiodiversityR",
  "reshape",
  "betapart",
  "RAD",
  "multcomp",
  "RColorBrewer"
)

## If these are not installed already and you are running Linux, make sure to install the following:
## In terminal: 
## yay -S cmake gg-fortran (EndeavourOS or other Arch-based distro)
## In R (after calling the x <- c(...) vector above):

install.packages(x) 
```
Fix for rstudio-bin:
(You might not have a to do this)

`sudo nvim /usr/share/applications/rstudio.desktop` and append
`Exec=/usr/bin/rstudio-bin %F` to `Exec=/usr/bin/rstudio-bin %f --no-sandbox`

Mounting cloud drives using rclone

[Download system service here](https://gist.github.com/kabili207/2cd2d637e5c7617411a666d8d7e97101)

```shell
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
```

# Set up bluetooth
```shell
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```