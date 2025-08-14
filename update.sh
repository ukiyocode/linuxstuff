#!/bin/sh

# if not root, run as root
if [ $(id -u) -ne 0 ] 
then
	printf "**** nala ****\n"
    sudo -i sh -c "nala full-upgrade -y; sudo -i nala autopurge; sudo -i nala clean"
fi

printf "\n****** nix ******\n"
rm -f ~/.config/alacritty/alacritty.toml
nix flake update --flake .config/home-manager
home-manager switch --show-trace
nix-collect-garbage -d --quiet

printf "\n**** flatpak ****\n"
flatpak update -y

printf "\n**** docker ****\n"
docker compose -f ~/docker/docker-compose.yml down
docker compose -f ~/docker/docker-compose.yml pull --ignore-buildable
docker compose -f ~/docker/docker-compose.yml up -d

printf "\nPress enter to continue..."


read _
