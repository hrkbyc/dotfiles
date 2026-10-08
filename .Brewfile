cask_args appdir: "/Applications"

tap "homebrew/bundle"
tap "homebrew/services"
tap "dart-lang/dart"
tap "hashicorp/tap"
tap "leoafarias/fvm"
tap "shopify/shopify"
tap "stablyai/orca"

# 汎用の CLI ツールは Home Manager（nix/packages.nix）で管理する。
# ここに残すのは、Nix に移すと不都合があるもの・GUI・ライブラリ・ランタイム類。

# ------------------------------------------------------------------
# シェル・ターミナル
# ------------------------------------------------------------------
# bat / eza / fd / ripgrep などのコマンド置き換え系、starship / tmux / vim / jq なども nix/packages.nix
brew 'bash-completion'
# direnv は Home Manager（nix/direnv.nix）で nix-direnv と一緒に管理する
# zsh-autosuggestions は brew ではなく ~/.zsh/ への手動 clone で管理している
# （.zshrc が ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh を source）
# Nix の gnugrep は grep の名前で入り macOS の grep を置き換えるため、g 接頭辞で入る brew 版を使う
brew 'grep'
# Nix では inetutils（ping / hostname なども一緒に入る）になるため brew のまま
brew 'telnet'
# brew bundle が Mac App Store の行を処理するのに使う
brew 'mas'

# ------------------------------------------------------------------
# バージョン管理・Git
# ------------------------------------------------------------------
# gh / git-lfs / git-secrets / git-filter-repo / gitleaks は nix/packages.nix
brew 'anyenv'
# キーチェーン連携（credential-osxkeychain）などがあるので当面 brew のまま
brew 'git'

# ------------------------------------------------------------------
# 言語・ランタイム
# ------------------------------------------------------------------
# JDK は cask の zulu@21/@17/@11 を jenv で管理する（下の cask セクション参照）。
# formula の openjdk@17 は Zulu 17.0.16 と完全に重複していたため削除した。
brew 'perl'
brew 'php'
brew 'rustup'
brew 'protobuf'
brew 'cmake'
brew 'pkgconf'

# ------------------------------------------------------------------
# クラウド・インフラ
# ------------------------------------------------------------------
brew 'awscli'
brew 'azure-cli'
# terraform は tfenv（anyenv 経由）で管理する。brew で入れると PATH が競合するため記載しない
# terraformer / circleci は nix/packages.nix

# ------------------------------------------------------------------
# データベース・ミドルウェア
# ------------------------------------------------------------------
brew 'mysql-client'
brew 'mysql-client@8.4'
brew 'redis'
brew 'berkeley-db'
brew 'unbound'

# ------------------------------------------------------------------
# メディア・画像処理
# ------------------------------------------------------------------
brew 'ffmpeg'
brew 'srt'
brew 'jpeg'
brew 'librsvg'
brew 'leptonica'
brew 'poppler'
brew 'libxml2'

# ------------------------------------------------------------------
# AI CLI
# ------------------------------------------------------------------
brew 'gemini-cli'
brew 'crit'

# ==================================================================
# cask
# ==================================================================

# --- ブラウザ・コミュニケーション ---
cask 'google-chrome'
cask 'zoom'
cask 'teamviewer'
cask 'deepl'
cask 'google-japanese-ime'

# --- 開発 ---
cask 'visual-studio-code'
cask 'android-studio'
cask 'unity-hub'
cask 'docker'
cask 'docker-desktop'
cask 'sourcetree'
cask 'sequel-ace'
cask 'postman'
cask 'ngrok'
cask 'chromedriver'
cask 'xcodes'
cask 'xcodes-app'
cask 'cmux'
cask 'codex'
cask 'orca'
cask 'chatgpt-atlas'
cask 'google-gemini'

# --- JDK（jenv に登録して切り替える。global は 21）---
cask 'zulu@21'
cask 'zulu@17'
cask 'zulu@11'

# --- Python ディストリビューション ---
cask 'miniforge'
cask 'anaconda'

# --- ユーティリティ ---
cask '1password'
cask 'alfred'
cask 'appcleaner'
cask 'bartender'
cask 'clipy'
cask 'rectangle'
cask 'swiftbar'
cask 'keyboardcleantool'
cask 'grandperspective'
cask 'keka'
cask 'rar'
cask 'the-unarchiver'
cask 'sf-symbols'

# --- ストレージ・同期・リモート ---
cask 'google-drive'
cask 'box-drive'
cask 'synology-drive'
cask 'cyberduck'
cask 'tailscale-app'
cask 'jump-desktop'
cask 'jump-desktop-connect'
cask 'microsoft-remote-desktop'
cask 'chrome-remote-desktop-host'
cask 'realvnc-connect-viewer'
cask 'vnc-viewer'
cask 'windows-app'
# cask 'dropbox'

# --- クリエイティブ・3D・GIS ---
cask 'adobe-creative-cloud'
cask 'blender'
cask 'autodesk-fusion'
cask 'paraview'
cask 'qgis'
cask 'obs'
cask 'blackhole-2ch'

# --- その他 ---
cask 'obsidian'
cask 'zotero'
cask 'kobo'
cask 'spotify'
cask 'steam'
cask 'google-earth-pro'
# cask 'kindle'  ※ Homebrew から削除済み

# --- フォント ---
cask 'font-hack-nerd-font'

# ==================================================================
# Mac App Store
# ==================================================================
# mas list が空を返すため、インストール状況は未確認
mas 'RunCat', id: 1429033973
mas 'WireGuard', id: 1451685025
# mas 'LINE', id: 539883307
# mas 'GoodNotes', id: 1444383602
# mas 'Final Cut Pro', id: 424389933
