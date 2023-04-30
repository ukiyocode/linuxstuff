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

source ~/github/powerlevel10k/powerlevel10k.zsh-theme

grep -qxF 'source ~/github/powerlevel10k/powerlevel10k.zsh-theme' $HOME/.zshrc ||\
  echo 'source ~/github/powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc
grep -qxF 'source ~/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' $HOME/.zshrc ||\
  echo 'source ~/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> $HOME/.zshrc
grep -qxF 'source ~/github/zsh-autosuggestions/zsh-autosuggestions.zsh' $HOME/.zshrc ||\
  echo 'source ~/github/zsh-autosuggestions/zsh-autosuggestions.zsh' >> $HOME/.zshrc
grep -qxF 'source ~/github/zsh-history-substring-search/zsh-history-substring-search.zsh' $HOME/.zshrc ||\
  echo 'source ~/github/zsh-history-substring-search/zsh-history-substring-search.zsh' >> $HOME/.zshrc

grep -qxF "bindkey '^[OA' history-substring-search-up" $HOME/.zshrc ||\
  echo "bindkey '^[OA' history-substring-search-up" >> $HOME/.zshrc
grep -qxF "bindkey '^[OB' history-substring-search-down" $HOME/.zshrc ||\
  echo "bindkey '^[OB' history-substring-search-down" >> $HOME/.zshrc
  
sed -i -e "/^printf \"Press enter to continue...\"/,+1d" $HOME/update.sh
grep -qxF 'git -C $HOME/github/powerlevel10k pull' $HOME/update.sh ||\
  echo 'printf "**** powerlevel10k ****\\n"\ngit -C $HOME/github/powerlevel10k pull' >> $HOME/update.sh
grep -qxF 'git -C $HOME/github/zsh-autosuggestions pull' $HOME/update.sh ||\
  echo 'printf "**** zsh-autosuggestions ****\\n"\ngit -C $HOME/github/zsh-autosuggestions pull' >> $HOME/update.sh
grep -qxF 'git -C $HOME/github/zsh-syntax-highlighting pull' $HOME/update.sh ||\
  echo 'printf "**** zsh-syntax-highlighting ****\\n"\ngit -C $HOME/github/zsh-syntax-highlighting pull' >> $HOME/update.sh
grep -qxF 'git -C $HOME/github/zsh-history-substring-search pull' $HOME/update.sh ||\
  echo 'printf "**** zsh-history-substring-search ****\\n"\ngit -C $HOME/github/zsh-history-substring-search pull' >> $HOME/update.sh
echo 'printf "Press enter to continue..."' >> $HOME/update.sh
echo 'read _' >> $HOME/update.sh
