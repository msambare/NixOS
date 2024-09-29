{ pkgs, lib, disk_tools, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  disk_tools_options = [ "fio" "gparted" "hdparm" "impression" "iotop" "smartmontools" "sysstat" "usbimager" "ventoy-full" ];
in
functions.makeModuleConfig {
  options = disk_tools_options;
  current = disk_tools;
  module_name = "disk_tools";
}
