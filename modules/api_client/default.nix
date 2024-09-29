{ pkgs, lib, api_client, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  api_client_options = [ "insomnia" "postman" ];
in
functions.makeModuleConfig {
  options = api_client_options;
  current = api_client;
  module_name = "api_client";
}
