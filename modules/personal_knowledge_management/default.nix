{ pkgs, lib, personal_knowledge_management, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  personal_knowledge_management_options = [ "logseq" ];
in
functions.makeModuleConfig {
  options = personal_knowledge_management_options;
  current = personal_knowledge_management;
  module_name = "personal_knowledge_management";
}
