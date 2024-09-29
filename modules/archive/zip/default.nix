{ pkgs, lib, config, username, ... }: {

    options = {
        zip.enable = lib.mkEnableOption "enables zip";
    };

    config = lib.mkIf config.zip.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ zip ];
        };
    };
}
