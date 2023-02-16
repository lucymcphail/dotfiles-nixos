{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (agda.withPackages (with agdaPackages; [
      standard-library
      cubical
    ]))
  ];

  home.file.".agda/defaults".text = ''
  standard-library
  cubical
  '';
}
