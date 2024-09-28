{ pkgs, lib, config, username, ... }: {

    options = {
        chromium.enable = lib.mkEnableOption "enables chromium";
    };

    config = lib.mkIf config.chromium.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ chromium ];
        };
    };
}