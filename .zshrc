###############################
### Oh-My-Zsh Configuration ###
###############################

### Set oh-my-zsh path
export ZSH="$HOME/.oh-my-zsh"

### Set theme
ZSH_THEME="robbyrussell"

## Spaceship settings
SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SYMBOL="⚡"

## Minimal spaceship sections for performance
SPACESHIP_PROMPT_ORDER=(
  time
  user
  dir
  git
  line_sep
  char
)

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

## spaceship
## https://spaceship-prompt.sh/config/intro/
# source "$HOME/.zsh/spaceship/spaceship.zsh"

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

## oh my posh - https://ohmyposh.dev/docs/
eval "$(oh-my-posh init zsh --config '~/.config/.oh-my-posh.conf.json')"