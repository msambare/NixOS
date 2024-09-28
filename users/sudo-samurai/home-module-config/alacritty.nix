{ lib, config, username, ... }: {

  lib.mkIf config.alacritty.enable {
    programs.alacritty.settings = {
        font = {
          size = 12;
          family = "FiraCode";
        };
        colors = {
          primary = {
            background = "#1e1e1e";
            foreground = "#c5c8c6";
          };
        };
      };
  };
}
