{ inputs, lib, config, pkgs, ... }: {

  imports = [
    inputs.hardware.nixosModules.framework

    ./hardware-configuration.nix

    ../common
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "angel";

  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = true;
  security.pam.services.xscreensaver.fprintAuth = true;

  system.stateVersion = "22.05";
}
