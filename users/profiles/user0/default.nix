{
  config,
  flake,
  pkgs,
  ...
}: let
  hostname = config.networking.hostName;
  inherit
    (flake.config.people)
    user0
    ;
in {
  users = {
    users.${flake.config.people.user0} = {
      description = flake.config.people.users.${flake.config.people.user0}.name;
      isNormalUser = true;
      hashedPassword = "$y$j9T$5s53WJ9/xHH/8sY1X4eLk/$nkNlK3879UGpALjflkIUdN7j245Qp36dBYPrboAuJz8";
      shell = pkgs.nushell;
      extraGroups = [
        "adbusers"
        "disk"
        "keys"
        "libvirtd"
        "netdev"
        "networkmanager"
        "vboxusers"
        "wheel"
      ];
    };
  };
  home-manager.users = {
    ${flake.config.people.user0} = {
      home = {
        username = user0;
        homeDirectory = "/home/${user0}";
        file = {
          "./justfile".source = ./justfile;
          "./.local/share/Steam/steam_dev.cfg".source = ../../../nixos/modules/steam/steam_dev.cfg;

          "./.config/fcitx5/conf/notfifications.conf".source = ./fcitx5/conf/notifications.conf;
          "./.config/fcitx5/config".source = ./fcitx5/config;
          "./.config/fcitx5/profile".source = ./fcitx5/profile;
        };

        sessionVariables = {};
      };
      imports = [
        {home.stateVersion = config.system.stateVersion;}
        (import ./configs/${hostname}.nix {inherit flake;})
      ];
    };
  };
}
