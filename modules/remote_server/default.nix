{ pkgs, lib, remote_servers, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  remote_server_options = [ "filezilla" "termius" ];
in
functions.makeModuleConfig {
  options = remote_server_options;
  current = remote_servers;
  module_name = "remote_server";
}
