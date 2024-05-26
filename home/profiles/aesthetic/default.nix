{
  imports = [
    # editors

    # services
    ../../services/ags

    # media services
    ../../services/media/playerctl.nix

    # software
    ../../software
    ../../software/wayland

    # system services
    ../../services/system/gpg-agent.nix
    ../../services/system/polkit-agent.nix
    ../../services/system/power-monitor.nix
    ../../services/system/screensht.nix
    ../../services/system/syncthing.nix

    # wayland specific

    # terminal emulators
    ../../terminal/emulators/foot.nix
  ];
}
