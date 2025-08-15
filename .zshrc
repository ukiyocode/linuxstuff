# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hajin/.zshrc'
autoload -Uz compinit
compinit

# Aliases
alias grep="grep -i"
alias cat="bat"
alias ll="eza --all --long --header --icons --git --group-directories-first"
alias tree="eza --all --long --header --icons --git --group-directories-first --tree"

# Env variables
# export TERM="xterm-256color"
export EDITOR="micro"
export LESS="--mouse --wheel-lines=10 -R"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export MICRO_TRUECOLOR=1

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Theme
if [ "$TERM" != "linux" ]; then
	eval "$(starship init zsh)"
fi
