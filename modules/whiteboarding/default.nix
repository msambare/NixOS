{ pkgs, lib, whiteboarding, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  whiteboarding_options = [ "lorien" ];
in
functions.makeModuleConfig {
  options = whiteboarding_options;
  current = whiteboarding;
  module_name = "whiteboarding";
}
