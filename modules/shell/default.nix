{ pkgs, lib, shell, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  shell_options = [ "fish" ];
in
functions.makeModuleConfig {
  options = shell_options;
  current = shell;
  module_name = "shell";
}
