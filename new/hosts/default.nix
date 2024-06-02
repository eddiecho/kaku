{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system"

    inherit (import "${self}/system") desktop laptop;

    specialArgs = {inherit inputs self;};
  in {
    nixconf = nixosSystem {
      inherit = specialArgs;
      modules =
        laptop
        ++ [
          ./aesthetic

          #"${mod}/programs/locale.nix"
          "${mod}/core/locale.nix"
        ];
    };
  };
}
