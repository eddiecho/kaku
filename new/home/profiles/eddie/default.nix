{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "eddie@home" = [
      ../.
      ./laptop
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfiguration = {
      "eddie" = homeManagerConfiguration {
        modules = homeImports."eddie@home";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
