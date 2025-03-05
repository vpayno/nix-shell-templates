{
  description = "Nix shell flake example";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    packageOverrides = pkgs.callPackage ./shell-python.nix {};
    pythonSet = pkgs.python3.override {inherit packageOverrides;};

    commonPkgs = with pkgs; [
      bashInteractive
      coreutils
      fzf
      git-cliff
      glow
      gum
      jq
      moreutils
      nixfmt-rfc-style
      runme
      taplo-cli
      xmlformat
      xq
      yaml-language-server
      yaml-merge
      yaml2json
      yamlfix
      yamllint
      yq-go
    ];

    pythonPkgs = with pkgs; [
      pdm
      pyright
      ruff
      ruff-lsp
      uv
      (pythonSet.withPackages (pypkgs:
        with pypkgs; [
          black
          icecream
          ipython
          isort
          mypy
          pylint
          requests # using our version from pip2nix
        ]))
    ];
  in {
    formatter = pkgs.nixfmt-rfc-style;

    devShells.x86_64-linux = {
      default = pkgs.mkShell {
        packages = commonPkgs;
      };
      python = pkgs.mkShell {
        packages = commonPkgs ++ pythonPkgs;
      };
    };
  };
}
