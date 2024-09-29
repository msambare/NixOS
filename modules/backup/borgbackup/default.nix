{ pkgs, lib, config, username, ... }: {

    options = {
        borgbackup.enable = lib.mkEnableOption "enables borgbackup";
    };

    config = lib.mkIf config.borgbackup.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ borgbackup ];
        };
    };
}
