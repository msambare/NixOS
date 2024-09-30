{ pkgs, lib, privacy, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  privacy_options = [ "kleopatra" "age" "rage" ];
in
functions.makeModuleConfig {
  options = privacy_options;
  current = privacy;
  module_name = "privacy";
}
