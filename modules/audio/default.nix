{ pkgs, lib, audio, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  audio_options = [ "audacity" ];
in
functions.makeModuleConfig {
  options = audio_options;
  current = audio;
  module_name = "audio";
}
