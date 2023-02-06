#!/bin/bash

# --------------------------------------------
# .Brewfileに記載されているアプリケーションをインストール 
# --------------------------------------------

if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

brew bundle --global