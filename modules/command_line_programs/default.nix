{ pkgs, lib, command_line_programs, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  command_line_program_options = [ "fzf" "jq" "ncdu" "neofetch" "nerdfetch" "sshs" "tree" ];
in
functions.makeModuleConfig {
  options = command_line_program_options;
  current = command_line_programs;
  module_name = "command_line_programs";
}
