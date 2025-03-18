{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  buildInputs = [
    pkgs.lua-language-server
    pkgs.lua54Packages.luarocks
    pkgs.stylua
  ];

}
