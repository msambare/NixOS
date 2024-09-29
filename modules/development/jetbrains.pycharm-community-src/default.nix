{ pkgs, lib, config, username, ... }: {

    options = {
        jetbrains.pycharm-community-src.enable = lib.mkEnableOption "enables jetbrains.pycharm-community-src";
    };

    config = lib.mkIf config.jetbrains.pycharm-community-src.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ jetbrains.pycharm-community-src ];
        };
    };
}
