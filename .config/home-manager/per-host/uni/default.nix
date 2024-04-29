# User-specific options specific to this particular host machine.

{ pkgs, ... }:

let
  hostName = import ../../hostName.nix;
in
{
  # By importing this here, the user can choose whether or not this is done
  # (unlike if this were imported by ../../common but the user wanted to import
  # ../../common).
  imports = [
    (../../common/per-host + "/${hostName}")
  ];

  my.debugging.support = {
    sourceCode.of.prebuilt.packages = with pkgs; [
    ];
  };
}
