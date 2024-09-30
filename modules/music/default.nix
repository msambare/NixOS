{ pkgs, lib, music, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  music_options = [ "spotify" ];
in
functions.makeModuleConfig {
  options = music_options;
  current = music;
  module_name = "music";
}
