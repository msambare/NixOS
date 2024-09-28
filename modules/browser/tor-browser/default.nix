{ pkgs, lib, config, username, ... }: {

    options = {
        tor-browser.enable = lib.mkEnableOption "enables tor-browser";
    };

    config = lib.mkIf config.tor-browser.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ tor-browser ];
        };
    };
}