{ pkgs, lib, config, username, ... }: {

    options = {
        maestral.enable = lib.mkEnableOption "enables maestral";
    };

    config = lib.mkIf config.maestral.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ maestral ];
        };
    };
}
