{ pkgs, lib, office, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  office_options = [ "libreoffice-fresh" "onlyoffice-bin_latest" ];
in
functions.makeModuleConfig {
  options = office_options;
  current = office;
  module_name = "office";
}
