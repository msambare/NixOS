{ pkgs, lib, config, username, ... }: {

    options = {
        filezilla.enable = lib.mkEnableOption "enables filezilla";
    };

    config = lib.mkIf config.filezilla.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ filezilla ];
        };
    };
}
