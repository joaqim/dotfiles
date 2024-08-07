{lib, ...}: {
  networking = {
    hostName = "deck";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # let you SSH in over the public internet
        8080 # misc
        25565 # local minecraft server
      ];
    };
  };
  services = {
    sshd.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
  };
}
