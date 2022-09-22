{ pkgs, ... }:

{
  home.packages = with pkgs; [
    burpsuite
    gdb
    ghidra
    pwndbg
    radare2
    toybox
  ];
}
