{ pkgs, ... }:

{
  home.packages = with pkgs.haskellPackages; [
    hindent
    hlint
  ] ++ [ pkgs.ghc ];
}
