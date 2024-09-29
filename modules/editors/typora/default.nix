{ pkgs, lib, config, username, ... }: {

    options = {
        typora.enable = lib.mkEnableOption "enables typora";
    };

    config = lib.mkIf config.typora.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ typora ];
        };
    };
}
