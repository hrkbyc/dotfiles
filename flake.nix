{
  description = "hrkbyc の dotfiles（Home Manager standalone）";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      # ホストごとの差分はここと nix/hosts/<name>.nix にまとめる
      mkHome =
        {
          host,
          system ? "aarch64-darwin",
          username ? "hrkbyc",
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit username; };
          modules = [
            ./nix/home.nix
            ./nix/hosts/${host}.nix
          ];
        };
    in
    {
      homeConfigurations = {
        work = mkHome { host = "work"; };
        personal = mkHome {
          host = "personal";
          username = "ikadatic";
        };
      };

      # flake.lock で固定した版の home-manager CLI を `nix run .#home-manager` で使えるようにする
      packages.aarch64-darwin.home-manager = home-manager.packages.aarch64-darwin.default;
    };
}
