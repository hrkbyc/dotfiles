# 適用するホスト（work / personal）。例: make switch HOST=work
HOST ?=

# Do everything.
all: init switch defaults brew

# Set initial preference.
init:
	bash init.sh

# Link dotfiles and apply Home Manager configuration.
switch:
	$(if $(HOST),,$(error HOST=work または HOST=personal を指定してください))
	nix run .#home-manager -- switch --flake .#$(HOST)

# Set macOS system preferences.
defaults:
	bash defaults.sh

# Install macOS applications.
brew:
	bash brew.sh
