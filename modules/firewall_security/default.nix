{ pkgs, lib, firewall_security, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  firewall_security_options = [ "chkrootkit" "clamav" "fail2ban" ];
in
functions.makeModuleConfig {
  options = firewall_security_options;
  current = firewall_security;
  module_name = "firewall_security";
}
