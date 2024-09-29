{ pkgs, lib, cloud_programs, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  cloud_program_options = [ "awscli" "awscli2" "dropbox-cli" "rclone" ];
in
functions.makeModuleConfig {
  options = cloud_program_options;
  current = cloud_programs;
  module_name = "cloud_program";
}
