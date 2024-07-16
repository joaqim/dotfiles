{
  pkgs,
  config,
  ...
}: {
  devShells = {
    default = pkgs.mkShell {
      packages = builtins.attrValues {
        inherit
          (pkgs)
          age
          alejandra
          just
          nil
          sops
          ssh-to-age
          ;
      };
      shellHook = "${config.pre-commit.installationScript}";
    };
  };
}
