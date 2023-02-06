# Do everything.
all: init link defaults brew

# Set initial preference.
init:
	bash init.sh

# Link dotfiles.
link:
	bash link.sh

# Set macOS system preferences.
defaults:
	bash defaults.sh

# Install macOS applications.
brew:
	bash brew.sh