{ pkgs, ... }:

# 仕事用・個人用で共通の CLI ツール。
# .Brewfile から移したものは、Brewfile 側の記載を消して brew uninstall する
# （.zshrc で ~/.nix-profile/bin を homebrew より前に置いているので、残っていても Nix 版が使われる）。

{
  home.packages = with pkgs; [
    # コマンド置き換え系
    bat # cat
    bottom # top
    eza # ls
    dust # du
    duf # df
    fd # find
    procs # ps
    ripgrep # grep
    sd # sed
    zoxide # cd

    # シェル・ターミナル
    zsh-autosuggestions # .zshrc が ~/.nix-profile/share/zsh-autosuggestions/ から source する
    starship
    tmux
    reattach-to-user-namespace # .tmux.conf のコピーで使う
    tree
    # vim は nix/vim.nix（プラグインと一緒に管理）
    wget
    jq
    pv
    rsync

    # Git
    gh
    git-lfs
    git-secrets
    git-filter-repo
    gitleaks

    # クラウド・インフラ
    terraformer
    circleci-cli
  ];
}
