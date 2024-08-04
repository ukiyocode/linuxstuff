#!/bin/sh

[ ! -d "$HOME/github" ] && mkdir "$HOME/github"
[ ! -d "$HOME/github/powerlevel10k" ] && git -C $HOME/github clone --depth=1 https://github.com/romkatv/powerlevel10k.git;\
  git -C $HOME/github/powerlevel10k config pull.rebase false
[ ! -d "$HOME/github/zsh-autosuggestions" ] && git -C $HOME/github clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions;\
  git -C $HOME/github/zsh-autosuggestions config pull.rebase false
[ ! -d "$HOME/github/zsh-syntax-highlighting" ] && git -C $HOME/github clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting;\
  git -C $HOME/github/zsh-syntax-highlighting config pull.rebase false
[ ! -d "$HOME/github/zsh-history-substring-search" ] && git -C $HOME/github clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search;\
  git -C $HOME/github/zsh-history-substring-search config pull.rebase false
