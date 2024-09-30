{ pkgs, lib, config, username, ... }: {

    options = {
        zoom-us.enable = lib.mkEnableOption "enables zoom-us";
    };

    config = lib.mkIf config.zoom-us.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ zoom-us ];
        };
    };
}
