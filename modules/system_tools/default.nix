{ pkgs, lib, system_tools, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  system_tools_options = [ "ethtool" "lm_sensors" "pciutils" "usbutils" ];
in
functions.makeModuleConfig {
  options = system_tools_options;
  current = system_tools;
  module_name = "system_tools";
}
