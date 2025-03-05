# shell-python.nix
{pkgs ? import <nixpkgs> {}}: let
  # add requests package created with pip2nix
  # nix run github:nix-community/pip2nix -- generate "requests"
  # git add ./python-packages.nix
  packageOverrides = pkgs.callPackage ./python-packages.nix {};

  pythonSet = pkgs.python3.override {inherit packageOverrides;};
in
  pkgs.mkShell rec {
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

    packages = commonPkgs ++ pythonPkgs;

    env.LD_LIBRARY_PATH = with pkgs;
      lib.makeLibraryPath [
        stdenv.cc.cc.lib
        libz
      ];
    env."PDM_PYTHON" = ".venv";
    env."VENV_DIR" = ".venv";

    shellHook = ''
      unset PYTHONPATH
      [ -d $VENV_DIR ] && . $VENV_DIR/bin/activate
      printf '%s="%s"\n' VENV_DIR "$VENV_DIR" PYTHONPATH "$PYTHONPATH" PATH "$PATH"
      printf "\n"
      python --version
      printf "\n"
    '';
  }
