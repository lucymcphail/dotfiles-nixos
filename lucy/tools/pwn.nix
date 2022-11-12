{ pkgs, ... }:

{
  home.packages = with pkgs; [
    burpsuite
    gdb
    ghidra
    pwndbg
    radare2
    sage
  ];

  xdg.configFile."radare2/radare2rc".text = ''
  eco bright
  '';

  home.file.".gdbinit".text = ''
  set disassembly-flavor intel
  '';
}
