{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      extest.enable = true; # X11->Wayland SteamInput mapping
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraPackages = [pkgs.curl];
    };
    java.enable = true;
  };
  hardware.steam-hardware.enable = true;
  # Since extest fixes the keyboard on Wayland, we probably want autostart for Steam
  environment.systemPackages =
    [
      (pkgs.makeAutostartItem rec {
        name = "steam";
        package = pkgs.makeDesktopItem {
          inherit name;
          desktopName = "Steam";
          exec = "steam -silent %U";
          icon = "steam";
          extraConfig = {
            OnlyShowIn = "KDE";
          };
        };
      })
    ]
    ++ builtins.attrValues {
      # Dependencies used by some Wine/Proton emulation
      inherit
        (pkgs.gst_all_1)
        gst-plugins-bad
        gst-plugins-base
        gst-plugins-good
        gst-plugins-ugly
        ;
    };
}
