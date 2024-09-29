{ pkgs, lib, audios, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  audio_options = [ "audacity" ];
in
functions.makeModuleConfig {
  options = audio_options;
  current = audios;
  module_name = "audio";
}
