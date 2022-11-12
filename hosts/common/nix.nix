{ pkgs, inputs, lib, config, ... }:

{
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
    };

    # map flake inputs to registries
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # map registries to channels
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
  };
}
