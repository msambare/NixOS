{ pkgs, lib, command_line_tools, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  command_line_tool_options = [ "fzf" "jq" "ncdu" "neofetch" "nerdfetch" "sshs" "tree" ];
in
functions.makeModuleConfig {
  options = command_line_tool_options;
  current = command_line_tools;
  module_name = "command_line_tool";
}
