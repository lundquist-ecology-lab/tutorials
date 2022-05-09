## Application installation script (using yay)
```
yay -S cmake gg-fortran

yay -S neovim 
       kitty 
       libreoffice-fresh 
       r 
       python3
       python-pip
       obsidian 
       lazygit 
       cider 
       zoom 
       hunspell 
       hunspell-en_us 
       evolution 
       evolution-ews 
       nodejs 
       ttf-fira-sans 
       brave-bin 
       zsh 
       rclone 
       chrome-gnome-shell
       mariadb
       rstudio-desktop-bin
       yarn
       refind-efi
       rpi-imager
       steam
       vlc
       realvnc-vnc-viewer
       ranger
       gamemode
       nautlius-admin
       bluberry
```

## Theming 

Gnome extensions
  1. user theme
  2. just perfection
  3. impatience
  4. caffeine
  5. blur my shell

Gnome tweaks `modify window buttons`

Themes
1. Graphite GTK

```
cd \tmp
git clone https://github.com/vinceliuice/Graphite-gtk-theme
cd Graph*
.\install.sh --tweaks rimless normal darker
```
2. Tela icons
```
cd \tmp
git clone https://github.com/vinceliuice/Tela-icon-theme
cd Tela*
.\install.sh -a
```
This installs all color variations, pick both theme and icons using `Tweak Tools`

## Zsh

Install [oh-my-zsh](https://ohmyz.sh/)

```
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

`sudo nvim /usr/share/applications/rstudio.desktop` and append
`Exec=/usr/bin/rstudio-bin %f` to `Exec=/usr/bin/rstudio-bin %f --no-sandbox`
