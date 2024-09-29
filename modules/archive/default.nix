{ pkgs, lib, archives, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  archive_options = [ "gnutar" "p7zip" "unzip" "zip" "xz" ];
in
functions.makeModuleConfig {
  options = archive_options;
  current = archives;
  module_name = "archive";
}
