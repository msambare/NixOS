{ pkgs, lib, productivity, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  productivity_options = [ "atuin" "thefuck" "zoxide" "fd" ];
in
functions.makeModuleConfig {
  options = productivity_options;
  current = productivity;
  module_name = "productivity";
}
