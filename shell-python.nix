# shell-go.nix
{pkgs ? import <nixpkgs> {}}:
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
    (python3.withPackages (pypkgs:
      with pypkgs; [
        black
        icecream
        ipython
        isort
        mypy
        pylint
      ]))
  ];

  packages = commonPkgs ++ pythonPkgs;

  env = {
    LD_LIBRARY_PATH = with pkgs;
      lib.makeLibraryPath [
        stdenv.cc.cc.lib
        libz
      ];
    "PDM_PYTHON" = ".venv";
    "VENV_DIR" = ".venv";
  };

  shellHook = ''
    unset PYTHONPATH
    [ -d $VENV_DIR ] && . $VENV_DIR/bin/activate
    printf '%s="%s"\n' VENV_DIR "$VENV_DIR" PYTHONPATH "$PYTHONPATH" PATH "$PATH"
    printf "\n"
    python --version
    printf "\n"
  '';
}
