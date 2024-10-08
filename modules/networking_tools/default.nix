{ pkgs, lib, networking_tools, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  networking_tools_options = [ "dig" "dogdns" "doggo" "drill" "iftop" "inetutils" "iputils" "mtr" "netcat-gnu" "nettools" "nmap" "tcpdump" ];
in
functions.makeModuleConfig {
  options = networking_tools_options;
  current = networking_tools;
  module_name = "networking_tools";
}
