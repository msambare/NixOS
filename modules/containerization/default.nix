{ pkgs, lib, containerization, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  containerization_options = [ "docker-compose" ];
in
functions.makeModuleConfig {
  options = containerization_options;
  current = containerization;
  module_name = "containerization";
}
