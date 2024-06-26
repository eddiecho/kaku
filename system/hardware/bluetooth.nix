{pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
        powerOnBoot = true;
      };
    };
  };

  services.blueman.enable = true;
}
