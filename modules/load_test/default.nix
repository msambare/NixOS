{ pkgs, lib, load_test, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  load_test_options = [ "jmeter" "siege" ];
in
functions.makeModuleConfig {
  options = load_test_options;
  current = load_test;
  module_name = "load_test";
}
