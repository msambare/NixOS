{ pkgs, lib, terminal_multiplexers, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  terminal_multiplexers_options = [ "tmux" "zellij" ];
in
functions.makeModuleConfig {
  options = terminal_multiplexers_options;
  current = terminal_multiplexers;
  module_name = "terminal_multiplexers";
}
