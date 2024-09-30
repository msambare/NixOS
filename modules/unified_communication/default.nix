{ pkgs, lib, unified_communication, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  unified_communication_options = [ "zoom-us" ];
in
functions.makeModuleConfig {
  options = unified_communication_options;
  current = unified_communication;
  module_name = "unified_communication";
}
