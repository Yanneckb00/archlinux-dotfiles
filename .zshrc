# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################
### Oh-My-Zsh Configuration ###
###############################

### Set oh-my-zsh path
export ZSH="$HOME/.oh-my-zsh"

### Set theme
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# install with git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# POWERLEVEL9K_MODE="nerdfont-complete"

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
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## https://spaceship-prompt.sh/config/intro/
# source "$HOME/.zsh/spaceship/spaceship.zsh"

### https://github.com/dacrab/fastfetch-config

fastfetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
