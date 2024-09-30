{ pkgs, lib, x_programs, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  x_programs_options = [ "xclip" "xtrlock-pam" ];
in
functions.makeModuleConfig {
  options = x_programs_options;
  current = x_programs;
  module_name = "x_programs";
}
