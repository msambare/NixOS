{ pkgs, lib, window_manager, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  window_manager_options = [ "i3" ];

  # Define imports conditionally based on window_manager
  conditional_imports = if builtins.isList window_manager then
    if builtins.elem "hyprland" window_manager
    then []
    else [ ./x11.nix ]
  else
    if window_manager == "hyprland"
    then []
    else [ ./x11.nix ];

in
# Pass everything directly into the function, including imports
functions.makeModuleConfig {
  options = window_manager_options;
  current = window_manager;
  module_name = "window_manager";
  conditional_imports = conditional_imports;
}
