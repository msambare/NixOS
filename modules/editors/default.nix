{ pkgs, lib, editors, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  editors_options = [ "sublime4" "typora" "vscode-with-extensions" "neovim" "vimPlugins-nvchad-ui" ];
in
functions.makeModuleConfig {
  options = editors_options;
  current = editors;
  module_name = "editors";
}
