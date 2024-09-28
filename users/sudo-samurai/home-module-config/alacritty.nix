{ lib, config, username, ... }: {

    options = {
        alacritty.enable = lib.mkEnableOption "enables alacritty config";
    };

  config = lib.mkIf config.alacritty.enable {
    # home-manager.users.${username}.programs.alacritty = {
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
  };
}
