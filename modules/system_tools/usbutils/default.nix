{ pkgs, lib, config, username, ... }: {

    options = {
        usbutils.enable = lib.mkEnableOption "enables usbutils";
    };

    config = lib.mkIf config.usbutils.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ usbutils ];
        };
    };
}
