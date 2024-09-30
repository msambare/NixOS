{ pkgs, lib, password_managers, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  password_manager_options = [ "_1password-gui" ];
in
functions.makeModuleConfig {
  options = password_manager_options;
  current = password_managers;
  module_name = "password_manager";
}
