{ pkgs, lib, config, username, ... }: {

    options = {
        iotop.enable = lib.mkEnableOption "enables iotop";
    };

    config = lib.mkIf config.iotop.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ iotop ];
        };
    };
}
