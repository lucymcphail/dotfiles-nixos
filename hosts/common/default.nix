{ pkgs, inputs, ... }:

{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

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

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.zsh.enable = true;

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    iosevka
    inter
  ];

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
}
