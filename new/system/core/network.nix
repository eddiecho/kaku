{
  lib,
  ...
}: {
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi.powersave = true;
  };

  # enables wireless support via wpa_supplicant
  # networking.wireless.enable = true;

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    resolved.enabled = true;
  };

  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
