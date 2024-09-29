{ pkgs, lib, config, username, ... }: {

    options = {
        p7zip.enable = lib.mkEnableOption "enables p7zip";
    };

    config = lib.mkIf config.p7zip.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ p7zip ];
        };
    };
}
