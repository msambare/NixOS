{ pkgs, lib, config, username, ... }: {

    options = {
        libreoffice-fresh.enable = lib.mkEnableOption "enables libreoffice-fresh";
    };

    config = lib.mkIf config.libreoffice-fresh.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ libreoffice-fresh ];
        };
    };
}
