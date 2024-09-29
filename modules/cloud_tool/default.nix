{ pkgs, lib, cloud_toolss, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  cloud_tool_options = [ "awscli" "awscli2" "dropbox-cli" "rclone" ];
in
functions.makeModuleConfig {
  options = cloud_tool_options;
  current = cloud_tools;
  module_name = "cloud_tool";
}
