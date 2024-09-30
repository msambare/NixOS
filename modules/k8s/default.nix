{ pkgs, lib, k8s, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  k8s_options = [ "kubectl" "helm" ];
in
functions.makeModuleConfig {
  options = k8s_options;
  current = k8s;
  module_name = "k8s";
}
