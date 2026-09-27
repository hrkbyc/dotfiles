cask_args appdir: "/Applications"

tap "homebrew/bundle"
tap "homebrew/services"
tap "dart-lang/dart"
tap "hashicorp/tap"
tap "leoafarias/fvm"
tap "shopify/shopify"
tap "stablyai/orca"

# ------------------------------------------------------------------
# CLI（コマンド置き換え系）
# ------------------------------------------------------------------
brew 'bat' #cat
brew 'bottom' #top
brew 'eza' #ls  ※ exa は Homebrew から削除されたため後継の eza に変更
brew 'dust' #du
brew 'duf' #df
brew 'fd' #find
brew 'httpie' #curl
brew 'procs' #ps
brew 'ripgrep' #grep
brew 'sd' #sed
brew 'zoxide' #cd

# ------------------------------------------------------------------
# シェル・ターミナル
# ------------------------------------------------------------------
brew 'starship'
brew 'tmux'
brew 'reattach-to-user-namespace'
brew 'bash-completion'
brew 'direnv'
# zsh-autosuggestions は brew ではなく ~/.zsh/ への手動 clone で管理している
# （.zshrc が ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh を source）
brew 'tree'
brew 'vim'
brew 'grep'
brew 'wget'
brew 'jq'
brew 'pv'
brew 'telnet'
brew 'rsync'
brew 'mas'

# ------------------------------------------------------------------
# バージョン管理・Git
# ------------------------------------------------------------------
brew 'anyenv'
brew 'git'
brew 'gh'
brew 'git-lfs'
brew 'git-secrets'
brew 'git-filter-repo'
brew 'gitleaks'

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
brew 'terraformer'
brew 'circleci'

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
