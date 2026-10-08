# --------------------------------------------
# Mac の環境設定（旧 defaults.sh）
# --------------------------------------------
# switch のたびに `defaults write` で書き込まれる。ユーザー単位の設定なので nix-darwin は不要。
# Finder の表示系は、反映に Finder の再起動（`killall Finder`）が必要なことがある。

{
  targets.darwin.defaults = {
    "com.apple.finder" = {
      AppleShowAllFiles = true; # 隠しファイルを表示する
      ShowStatusBar = true; # ステータスバーを表示
      ShowPathbar = true; # パスバーを表示
    };

    # USB やネットワークストレージに .DS_Store ファイルを作成しない
    "com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };
  };
}
