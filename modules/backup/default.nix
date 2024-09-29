{ pkgs, lib, backup, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  backup_options = [ "borgbackup" "duplicity" "restic" "vorta" ];
in
functions.makeModuleConfig {
  options = backup_options;
  current = backup;
  module_name = "backup";
}
