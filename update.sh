#!/bin/sh

# if not root, run as root
if [ $(id -u) -ne 0 ] 
then
    printf "**** nala ****\n"
    sudo -i sh -c "nala upgrade -y; sudo -i nala autopurge; sudo -i nala clean"
fi

printf "\n**** homebrew ****\n"
brew update
brew upgrade
brew doctor

printf "\n**** flatpak ****\n"
flatpak update

printf "\n**** powerlevel10k ****\n"
git -C $HOME/github/powerlevel10k pull
printf "**** zsh-autosuggestions ****\n"
git -C $HOME/github/zsh-autosuggestions pull
printf "**** zsh-syntax-highlighting ****\n"
git -C $HOME/github/zsh-syntax-highlighting pull
printf "**** zsh-history-substring-search ****\n"
git -C $HOME/github/zsh-history-substring-search pull

printf "\n**** gamescope ****\n"
git -C $HOME/github/gamescope pull
printf "Press enter to continue..."


read _
