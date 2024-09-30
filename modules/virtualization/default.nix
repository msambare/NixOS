{ pkgs, lib, virtualization, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  virtualization_options = [ "bridge-utils" "virt-manager" ];
in
functions.makeModuleConfig {
  options = virtualization_options;
  current = virtualization;
  module_name = "virtualization";
}
