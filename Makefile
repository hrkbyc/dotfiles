# 適用するホスト（work / personal）。例: make switch HOST=work
HOST ?=

# Do everything.
all: init switch brew

# Set initial preference.
init:
	bash init.sh

# Apply Home Manager configuration (dotfiles links, CLI tools, macOS preferences).
switch:
	$(if $(HOST),,$(error HOST=work または HOST=personal を指定してください))
	nix run .#home-manager -- switch --flake .#$(HOST)

# Install macOS applications.
brew:
	bash brew.sh
