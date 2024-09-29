{ pkgs, lib, config, username, ... }: {

    options = {
        vimPlugins.nvchad-ui.enable = lib.mkEnableOption "enables vimPlugins.nvchad-ui";
    };

    config = lib.mkIf config.vimPlugins.nvchad-ui.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ vimPlugins.nvchad-ui ];
        };
    };
}
