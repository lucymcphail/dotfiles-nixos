{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (agda.withPackages [ agdaPackages.standard-library ])
  ];

  home.file.".agda/defaults".text = ''
  standard-library
  '';
}
