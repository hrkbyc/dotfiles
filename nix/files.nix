{ config, ... }:

# --------------------------------------------
# 設定ファイルのシンボリックリンクを home ディレクトリに作成（旧 link.sh）
# --------------------------------------------
# mkOutOfStoreSymlink で ~/dotfiles の実ファイルを直接指すので、
# 編集は switch なしで即反映される（store にコピーされない）。

let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
  link = name: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${name}";
in
{
  home.file = {
    ".zshrc".source = link ".zshrc";
    ".vimrc".source = link ".vimrc";    ".tmux.conf".source = link ".tmux.conf";
    ".gitconfig".source = link ".gitconfig";
    ".gitignore_global".source = link ".gitignore_global";
    ".config/starship.toml".source = link ".config/starship.toml";
    ".Brewfile".source = link ".Brewfile";
  };
}
