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
# bat / eza / fd / ripgrep などのコマンド置き換え系、starship / vim / jq なども nix/packages.nix
# direnv は Home Manager（nix/direnv.nix）で nix-direnv と一緒に管理する
# zsh-autosuggestions も nix/packages.nix
# Nix の gnugrep は grep の名前で入り macOS の grep を置き換えるため、g 接頭辞で入る brew 版を使う
brew 'grep'
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
# rustup は試しに入れただけで未使用のため外した（使うときは環境を作り直す）
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

# ------------------------------------------------------------------
# メディア・画像処理
# ------------------------------------------------------------------
brew 'ffmpeg'
brew 'librsvg'
brew 'poppler'

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
cask 'google-japanese-ime'

# --- 開発 ---
cask 'visual-studio-code'
cask 'android-studio'
cask 'unity-hub'
cask 'docker-desktop' # 旧名 docker は別名
cask 'sourcetree'
cask 'sequel-ace'
cask 'ngrok'
cask 'chromedriver'
cask 'xcodes-app' # 旧名 xcodes は別名
cask 'cmux'
cask 'codex'
cask 'orca'
cask 'google-gemini'

# --- JDK（jenv に登録して切り替える。global は 21）---
cask 'zulu@21'
cask 'zulu@17'
cask 'zulu@11'

# --- Python ディストリビューション ---
# .zshrc の conda は miniforge を使う。プロジェクトの Python は pyenv（anyenv 経由）。
# anaconda は未使用（conda 環境なし・参照なし）のため外した
cask 'miniforge'

# --- ユーティリティ ---
cask '1password'
cask 'raycast'
cask 'appcleaner'
cask 'rectangle'
cask 'swiftbar'
cask 'keyboardcleantool'
cask 'keka'
cask 'rar'
cask 'the-unarchiver'

# --- ストレージ・同期・リモート ---
cask 'google-drive'
cask 'box-drive'
cask 'synology-drive'
cask 'cyberduck'
cask 'tailscale-app'
cask 'jump-desktop'
cask 'jump-desktop-connect'
cask 'chrome-remote-desktop-host'
cask 'realvnc-connect-viewer' # 旧名 vnc-viewer は別名
cask 'windows-app' # 旧 microsoft-remote-desktop
# cask 'dropbox'

# --- クリエイティブ・3D・GIS ---
cask 'adobe-creative-cloud'
cask 'blender'
cask 'paraview'
cask 'qgis'
cask 'obs'
cask 'blackhole-2ch'

# --- その他 ---
cask 'obsidian'
cask 'zotero'
cask 'kobo'
cask 'steam'
cask 'google-earth-pro'
# cask 'kindle'  ※ Homebrew から削除済み

# --- フォント ---
# Hack Nerd Font は ~/Library/Fonts に手動で入れてある（brew 管理外のため記載しない）

# ==================================================================
# Mac App Store
# ==================================================================
# mas list が空を返すため、インストール状況は未確認
mas 'RunCat', id: 1429033973
mas 'WireGuard', id: 1451685025
# mas 'LINE', id: 539883307
# mas 'GoodNotes', id: 1444383602
# mas 'Final Cut Pro', id: 424389933
