{ pkgs, lib, remote_assistance, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  remote_assistance_options = [ "anydesk" ];
in
functions.makeModuleConfig {
  options = remote_assistance_options;
  current = remote_assistance;
  module_name = "remote_assistance";
}
