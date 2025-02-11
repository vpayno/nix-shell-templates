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

  goPkgs = with pkgs; [
    cue
    cuelsp
    errcheck
    gci
    go
    go
    go-audit
    go-critic
    go-errorlint
    go-licenses
    go-md2man
    go-tools
    gocyclo
    golangci-lint
    golines
    gomarkdoc
    gopkgs
    gopls
    gosec
    gotest
    gotestfmt
    gotests
    gotools
    govulncheck
    panicparse
    revive
  ];

  packages = commonPkgs ++ goPkgs;

  env = {
    LD_LIBRARY_PATH = with pkgs;
      lib.makeLibraryPath [
        stdenv.cc.cc.lib
        libz
      ];
    GOENV = "${pkgs.go}/share/go/go.env";
    GOROOT = "${pkgs.go}/share/go";
  };

  shellHook = ''
    export GOPATH="$PWD"
    export GOBIN="$GOPATH/.gobin"
    export GOSRC="$GOPATH/.gosrc"
    export PATH="$GOPATH/.gobin:$PATH"
    printf '%s="%s"\n' GOROOT "$GOROOT" GOENV "$GOENV" GOBIN "$GOBIN" GOSRC "$GOSRC" PATH "$PATH"
    printf "\n"
    mkdir -pv "$GOBIN" "$GOSRC"
    printf "\n"
    go version
    printf "\n"
  '';
}
