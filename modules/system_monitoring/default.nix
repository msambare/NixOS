{ pkgs, lib, system_monitoring, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  system_monitoring_options = [ "btop" "glances" "htop" "lsof" "nvtop" "virt-top" ];
in
functions.makeModuleConfig {
  options = system_monitoring_options;
  current = system_monitoring;
  module_name = "system_monitoring";
}
