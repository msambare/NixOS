{ pkgs, lib, graphics, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  graphics_options = [ "gimp" "inkscape" ];
in
functions.makeModuleConfig {
  options = graphics_options;
  current = graphics;
  module_name = "graphics";
}
