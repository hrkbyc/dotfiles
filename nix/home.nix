{ username, ... }:

{
  imports = [
    ./direnv.nix
    ./files.nix
    ./packages.nix
  ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  # Home Manager の初回導入時のリリース。後から上げない（上げると既定値の互換が変わる）
  home.stateVersion = "26.11";

  programs.home-manager.enable = true;
}
