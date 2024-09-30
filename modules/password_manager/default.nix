{ pkgs, lib, password_manager, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  password_manager_options = [ "one_password" ];
in
functions.makeModuleConfig {
  options = password_manager_options;
  current = password_manager;
  module_name = "password_manager";
}
