{ pkgs, lib, config, username, ... }: {

    options = {
        gnutar.enable = lib.mkEnableOption "enables gnutar";
    };

    config = lib.mkIf config.gnutar.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ gnutar ];
        };
    };
}
