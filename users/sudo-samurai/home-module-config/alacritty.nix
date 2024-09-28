{ pkgs, ... }: {
  # custom config for alacritty
  programs.alacritty = {
    enable = true;
    settings = {
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