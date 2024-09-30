{ pkgs, lib, config, username, ... }: {

    options = {
        vlc.enable = lib.mkEnableOption "enables vlc";
    };

    config = lib.mkIf config.vlc.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ vlc ];
        };
    };
}
