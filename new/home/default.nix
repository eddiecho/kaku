{
  lib,
  self,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-index-db.hmModules.nix-index
  ];

  home = {
    username = "eddie";
    homeDirectory = "/home/eddie";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
