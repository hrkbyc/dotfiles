# direnv と nix-direnv（`use flake` の評価結果をキャッシュし、cd のたびの再評価を避ける）。
# nix-direnv は Home Manager が ~/.config/direnv/lib/hm-nix-direnv.sh に置き、direnv が自動で読み込む。
# シェルへのフックは .zshrc の `eval "$(direnv hook zsh)"` で行う
# （programs.zsh を使っていないので、このモジュールの zsh 連携は効かない）。

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
