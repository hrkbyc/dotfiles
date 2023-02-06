#!/bin/bash

# -----------
# Macの環境設定
# -----------

if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

# 隠しファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true

# USBやネットワークストレージに.DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true