{ pkgs, lib, config, username, ... }: {

    options = {
        mononoki.enable = lib.mkEnableOption "enables mononoki";
    };

    config = lib.mkIf config.mononoki.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ mononoki ];
        };
    };
}
