{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      bless
      dconf2nix
      haskell-language-server
      rustup
      tokei
      typst
      typst-lsp
      typstfmt
      yamlfmt
      ;
    inherit
      (pkgs.nodePackages_latest)
      dotenv-cli
      forever
      nodejs
      ;
    inherit
      (pkgs.python312Packages)
      pyppeteer
      ;
  };
}
