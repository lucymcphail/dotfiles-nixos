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

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  services.xserver = {
    enable = true;

    layout = "gb";
    xkbVariant = "";
    xkbOptions = "ctrl:nocaps,compose:ralt";

    displayManager.lightdm.enable = true;

    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages : [
          haskellPackages.xmonad-contrib
          haskellPackages.xmonad-extras
          haskellPackages.xmonad
        ];
      };
    };
    displayManager.defaultSession = "xfce+xmonad";

    libinput.enable = true;
    libinput.touchpad.naturalScrolling = true;
  };

  programs.zsh.enable = true;

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    iosevka
    inter
  ];

  users.users = {
    lucy = {
      isNormalUser = true;
      shell = pkgs.zsh;
      description = "Lucy McPhail";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
