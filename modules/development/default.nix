{ pkgs, lib, development, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  development_options = [ "python312" "staruml" "sublime-merge" ];
in
functions.makeModuleConfig {
  options = development_options;
  current = development;
  module_name = "development";
}
