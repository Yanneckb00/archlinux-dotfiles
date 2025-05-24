das bitte auch formatieren und verbessern

# Arch Linux
## Arch Setup
- Boot from USB
- `loadkeys de-latin1`
- `ip addr show`

### WIFI CONNECT:
- `iwctl`
- `station wlan0 get-networks`
- `station wlan0 connect "<network-name>"`
- `exit`

- `ip addr show`
- `ping -c 4 google.com`

### SSH:
- `systemctl status sshd`
- check if running or else `systemctl start sshd`
- set password `passwd`
- connect with another terminal: `ssh root@<ip>`

### Arch Linux Install:
- `pacman -Sy && pacman-key --init && pacman -S archlinux-keyring && archinstall`
- archinstall language: `en`
- locales:
   - keyboard layout: `de`
   - locale language: `de_DE.UTF-8`
   - locale encoding: `UTF-8`
- disk configuration: best effort
- hostname: `archlinux`
- root password: `****`
- user account:
   - username: `username`
   - password: `****`
- profile:
   - profile: `GNOME, Hyprland`
   - graphics driver: `AMD / ATI (open source)`
   - greeter: `gdm`
- audio: `pipewire`
- kernels: `linux, linux-lts`
- network configuration: `network manager`
- timezone: `Europe/Berlin`
- additional packages: `vim nerd-fonts ufw`

## For Gnome:
- Reboot without Boot USB-Stick!

## For Hyperland:
after that go into chroot:
- `su <username>`
- `sudo systemctl enable ufw`
- `sudo pacman -S --needed git base-devel`
- `sudo pacman -S kitty`
- For HyDE Package:
    - `git clone --depth 1 https://github.com/HyDE-Project/HyDE ~/HyDE`
    - `cd ~/HyDE/Scripts`
    - `./install.sh`
- 

##############
# POST SETUP #
##############

## Post Setup
### Install YAY:
- `sudo pacman -S --needed git base-devel`
- `git clone https://aur.archlinux.org/yay.git`
- `cd yay`
- `makepkg -si`

### Install first YAYs on Arch Linux:
- Chrome: `yay -S google-chrome`
- VSCode: `yay -S visual-studio-code-bin`
- Discord: `yay -S discord`
- Spotify: `yay -S spotify`
- Chrome Gnome Shell: `yay -S chrome-gnome-shell`

### Install first pacmans on Arch Linux:
- Flatpak Store: `sudo pacman -S flatpak`
- OpenRGB: `sudo pacman -S openrgb`
- Gnome Tweaks: `sudo pacman -S gnome-tweaks gnome-shell-extensions`
- Firewall:`sudo pacman -S ufw`
    - `sudo ufw enable`
    - `sudo ufw default deny incoming`
    - `sudo ufw default allow outgoing`
    - `sudo ufw allow ssh`
    
## Oh My ZSH
- ZSH: `sudo apt-get install zsh`
- OMZ: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- 
- Fastfetch: `https://github.com/fastfetch-cli/fastfetch `
- Config all: `https://github.com/fastfetch-cli/fastfetch/blob/dev/presets/all.jsonc `
- powerlevel10k: `git clone https://github.com/romkatv/powerlevel10k.git`

## Flatpak Apps
- Extension Manager

## GNOME Customization
-> https://extensions.gnome.org/
- ArcMenu
- Blur My Shell
- Caffeine
- Clipboard Indicator
- Dash to Dock
- Forge
- GSConnect
- Just Perfection
- Media Controls
- Meida Progress
- Open Bar
- Removable Drive Menu
- User Themes
- Vitals


## Programms
- Libre Office
- Gimp
- Bottles (Windows Wine Manager)
- GDM-Settings
- Chrome
- Firefox
- Thunderbird
- Steam
- Spotify
- Discord
- Warehouse
- Proton
- NeoVim
- Lutris
- Heroric

### Wallpaper Engine:
https://github.com/Almamu/linux-wallpaperengine

## initialize git repo
- git init
- 