{ pkgs, lib, config, username, ... }: {

    options = {
        vimPlugins.nvchad.enable = lib.mkEnableOption "enables vimPlugins.nvchad";
    };

    config = lib.mkIf config.vimPlugins.nvchad.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ vimPlugins.nvchad ];
        };
    };
}
