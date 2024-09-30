{ pkgs, lib, config, username, ... }: {

    options = {
        siege.enable = lib.mkEnableOption "enables siege";
    };

    config = lib.mkIf config.siege.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ siege ];
        };
    };
}
