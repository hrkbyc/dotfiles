{ pkgs, lib, ... }:

# vim 本体とプラグイン（旧 dein.vim + ~/.vim/dein.toml）。
# programs.vim は .vimrc を生成するため使わず、.vimrc は files.nix で ~/dotfiles の実ファイルをリンクしたままにする。
# プラグインは ~/.vim/pack/nix/start/<名前> に置き、Vim 標準のパッケージ機能で起動時に読み込ませる。

let
  plugins = with pkgs.vimPlugins; [
    fzf-wrapper # fzf 本体の vim プラグイン（bin/fzf に fzf 本体へのリンクを持つので PATH に fzf は不要）
    fzf-vim
    molokai # カラースキーム
    lightline-vim # ステータスラインの表示強化
    vim-trailing-whitespace # 末尾の空白をハイライト
    indentLine # インデントの可視化
  ];
in
{
  home.packages = [ pkgs.vim ]; # macOS 標準と同じ機能（+clipboard、lua なし）で新しい版

  home.file = lib.listToAttrs (
    map (plugin: {
      name = ".vim/pack/nix/start/${lib.getName plugin}";
      value.source = plugin;
    }) plugins
  );
}
