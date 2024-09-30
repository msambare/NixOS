{ pkgs, lib, photo_tools, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  photo_tools_options = [ "darktable" "rawtherapee" ];
in
functions.makeModuleConfig {
  options = photo_tools_options;
  current = photo_tools;
  module_name = "photo_tools";
}
