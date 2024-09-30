{ pkgs, lib, config, username, ... }: {

    options = {
        deluge.enable = lib.mkEnableOption "enables deluge";
    };

    config = lib.mkIf config.deluge.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ deluge ];
        };
    };
}
