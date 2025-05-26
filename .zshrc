#########################
### Zsh Configuration ###
#########################

### Set language to German
export LANG=de_DE.UTF-8

### zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### Plugins via zinit
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Oh-My-Zsh style plugin replacements
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

### Load completions
autoload -U compinit && compinit

### replay cached completions
zinit cdreplay -q

### fastfetch
fastfetch

### clear + fastfetch alias
function cl() {
  command clear
  fastfetch
}

### Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias lg='lazygit'
alias ls='ls --color'

### Keybindings (^ = ctrl)
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

### History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase # erase all duplicates in history file
setopt appendhistory # append any commands to history file
setopt sharehistory # share history to all terminals
setopt hist_ignore_space # prevent command to be written in history by adding space in front
setopt hist_ignore_all_dups # ignore duplicates
setopt hist_save_no_dups # skip duplicates
setopt hist_ignore_dups # ignore duplicates
setopt hist_find_no_dups # dont show duplicates in history search

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # no case-sensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

### Theme via starship
eval "$(starship init zsh)"

### Shell intergrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

### for macos: eval "$(/opt/homebrew/bin/brew shellenv)"