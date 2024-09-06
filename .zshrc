export TERM=xterm-256color
setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

#p10k theme stuff
source ~/github/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#autocompletion & autosuggestions
source ~/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/github/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/github/zsh-history-substring-search/zsh-history-substring-search.zsh

#aliases
alias grep="grep -i"
alias ll="ls -lah --color=auto --group-directories-first"
alias gdu=gdu-go
#alias hh="distrobox-host-exec"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#bat stuff
if command -v bat &> /dev/null
then
	alias cat="bat"
	#export MANPAGER="bat -pl man"
	export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
	alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
fi

#fzf stuff
if command -v fzf &> /dev/null
then
	#export FZF_DEFAULT_COMMAND='fd --type f --hidden --color=always --exclude .wine .git'
	export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .wine --exclude .git"
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_ALT_C_COMMAND="fd -t d --hidden --exclude .wine --exclude .git"
	source <(fzf --zsh)
fi

#tmux stuff
if [[ $(ps -p $(ps -p $$ -o ppid=) -o args=) =~ "$(which st)" ]] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    if [ ! "$TMUX" ]; then
        tmux attach -t main || tmux new -s main
    fi
fi

typeset -A key
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      history-substring-search-up
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    history-substring-search-down

function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish  

command -v fastfetch &> /dev/null && fastfetch
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
