DOTFILES=~/dotfiles

.DEFAULT: all

all: nix home-manager

home-manager:
	home-manager switch --flake $(DOTFILES)

nix:
	sudo nixos-rebuild switch --flake $(DOTFILES)

update:
	nix flake update
