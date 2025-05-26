###############################
### Oh-My-Zsh Configuration ###
###############################

### Set oh-my-zsh path
export ZSH="$HOME/.oh-my-zsh"

### Set theme
ZSH_THEME="robbyrussell"


### Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

### Set language to German
export LANG=de_DE.UTF-8

### OMZ Plugins ###
## Load plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
  web-search
  copyfile
  copypath
  dirhistory
  history
  docker-compose
  composer
  common-aliases
  ssh
  git-auto-fetch
  macos
  themes
  vscode
)

## Plugin Configuration ##

## zsh-autosuggestions
## install: git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

## fastfetch
### https://github.com/dacrab/fastfetch-config
fastfetch

# run cl for clear and fastfetch init
function cl() {
  command clear
  fastfetch
}

## zsh highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

alias ..='cd ..'
alias ...='cd ../..'
alias lg='lazygit'