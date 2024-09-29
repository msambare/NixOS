{ pkgs, lib, cloud_toolss, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  cloud_tools_options = [ "insync" ];
in
functions.makeModuleConfig {
  options = cloud_tools_options;
  current = cloud_toolss;
  module_name = "cloud_tools";
}
