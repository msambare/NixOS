{ pkgs, lib, utility, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  utility_options = [ "copyq" "flameshot" "rambox" "ulauncher" "stow" ];
in
functions.makeModuleConfig {
  options = utility_options;
  current = utility;
  module_name = "utility";
}
