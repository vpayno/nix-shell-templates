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

  rustPkgs = with pkgs; [
    bacon
    cargo
    cargo-audit
    cargo-edit
    cargo-feature
    cargo-flamegraph
    cargo-llvm-cov
    rust-analyzer
    rustc
    rustfmt
    sccache
  ];

  packages = commonPkgs ++ rustPkgs;

  env = {
    LD_LIBRARY_PATH = with pkgs;
      lib.makeLibraryPath [
        stdenv.cc.cc.lib
        libz
      ];
    RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
  };

  shellHook = ''
    export CARGO_HOME="$PWD/.cargo"
    export PATH="$CARGO_HOME/bin:$PATH"
    printf '%s="%s"\n' CARGO_HOME "$CARGO_HOME" RUSTC_WRAPPER "$RUSTC_WRAPPER" PATH "$PATH"
    printf "\n"
    mkdir -pv "$CARGO_HOME"
    printf "\n"
    rustc --version
    printf "\n"
  '';
}
