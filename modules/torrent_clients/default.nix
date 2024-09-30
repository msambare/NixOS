{ pkgs, lib, torrent_clients, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  torrent_clients_options = [ "deluge" "stremio" ];
in
functions.makeModuleConfig {
  options = torrent_clients_options;
  current = torrent_clients;
  module_name = "torrent_clients";
}
