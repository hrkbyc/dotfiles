{ pkgs, ... }:

# 仕事用・個人用で共通の CLI ツール。
# .Brewfile から移したものは、Brewfile 側の記載を消して brew uninstall する
# （.zshrc で /opt/homebrew/bin が先頭にあるため、両方あると brew 版が優先される）。

{
  home.packages = with pkgs; [
  ];
}
