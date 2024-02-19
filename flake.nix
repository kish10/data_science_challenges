{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    scientificFhs = {
      url = github:olynch/scientific-fhs;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, scientificFhs }:
  let
    pkgs = nixpkgs.legacyPackages.${system};
    system = "x86_64-linux";
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      shellHook = ''
        # - Change bash prompt
        export PS1="\e[0;32m[(shell) \u@\H:\w]\$ \e[0m"
      '';

      packages = with pkgs; [
        julia
        jupyter
      ];
    };
  };
}
