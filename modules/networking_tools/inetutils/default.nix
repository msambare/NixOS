{ pkgs, lib, config, username, ... }: {

    options = {
        inetutils.enable = lib.mkEnableOption "enables inetutils";
    };

    config = lib.mkIf config.inetutils.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ inetutils ];
        };
    };
}
