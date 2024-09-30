{ pkgs, lib, privacys, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  privacy_options = [ "kleopatra" ];
in
functions.makeModuleConfig {
  options = privacy_options;
  current = privacys;
  module_name = "privacy";
}
