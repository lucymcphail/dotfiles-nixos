{ pkgs, inputs, ... }:

{
  imports = [
    ./nix.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.utf8";

  console.keyMap = "uk";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver = {
    enable = true;

    layout = "gb";
    xkbVariant = "";
    xkbOptions = "ctrl:nocaps,compose:ralt";

    # displayManager.gdm.enable = true;
    # desktopManager.gnome.enable = true;
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "plasmawayland";

    desktopManager.plasma5.enable = true;
  };

  programs.zsh.enable = true;

  virtualisation.docker.enable = true;

  users.users = {
    lucy = {
      isNormalUser = true;
      shell = pkgs.zsh;
      description = "Lucy McPhail";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
}
