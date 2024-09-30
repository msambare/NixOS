{ pkgs, lib, iacs, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  iac_options = [ "terraform" "vault" ];
in
functions.makeModuleConfig {
  options = iac_options;
  current = iacs;
  module_name = "iac";
}
