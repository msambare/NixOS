{ pkgs, lib, config, username, ... }: {

    options = {
        neovim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.neovim.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ neovim ];
        };
    };
}
