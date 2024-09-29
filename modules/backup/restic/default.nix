{ pkgs, lib, config, username, ... }: {

    options = {
        restic.enable = lib.mkEnableOption "enables restic";
    };

    config = lib.mkIf config.restic.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ restic ];
        };
    };
}
