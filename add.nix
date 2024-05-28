{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  network.hostName = "nixos"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # enable X11 windowing system
  services.xserver.enable = true;

  # enable gnome desktop
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # configure keymap in x11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # enable cups to print documents
  services.printing.enable = true;

  # enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # uncomment if you want to use JACK applications
    # jack.enable = true;

    # use the example session manager (no others are packages yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # enable touchpad support (enabled by default in most desktop managers
  # services.xserver.libinput.enable = true;

  # define a user account. Don't forget to set a password with 'passwd USERNAME'
  users.users.eddie = {
    isNormalUser = true;
    description = "Eddie Cho";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # automatic login
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "eddie";

  # workaround for gnome autologin: https://github.com/NixOs/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # install firefox
  programs.firefox.enable = true;

  # enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # list packages installed in system profile to search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wezterm
    git
    wget
  ];

  # some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services you want to enable:

  # enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # or disable the firewall altogether
  # networking.firewall.enable = false;

  # This value determines the NixOs release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
