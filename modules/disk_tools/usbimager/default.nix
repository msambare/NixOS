{ pkgs, lib, config, username, ... }: {

    options = {
        usbimager.enable = lib.mkEnableOption "enables usbimager";
    };

    config = lib.mkIf config.usbimager.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ usbimager ];
        };
    };
}
