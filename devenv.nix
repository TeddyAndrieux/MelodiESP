{ pkgs, ... }:

{
  name = "MelodiESP";

  packages = [
    pkgs.git
    pkgs.libclang
    pkgs.esphome
    pkgs.esptool
    pkgs.platformio-core
  ];

  languages.python = {
    enable = true;
    uv = {
      enable = true;
    };
    version = "3.14";
  };
}
