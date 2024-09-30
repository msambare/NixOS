{ pkgs, lib, fonts, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  fonts_options = [ "fira-code" "nerdfonts" "anonymousPro" "input-fonts" "mononoki" "source-code-pro" ];
in
functions.makeModuleConfig {
  options = fonts_options;
  current = fonts;
  module_name = "fonts";
}
