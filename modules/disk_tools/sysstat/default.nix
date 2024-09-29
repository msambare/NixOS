{ pkgs, lib, config, username, ... }: {

    options = {
        sysstat.enable = lib.mkEnableOption "enables sysstat";
    };

    config = lib.mkIf config.sysstat.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ sysstat ];
        };
    };
}
