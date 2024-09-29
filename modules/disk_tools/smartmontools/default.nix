{ pkgs, lib, config, username, ... }: {

    options = {
        smartmontools.enable = lib.mkEnableOption "enables smartmontools";
    };

    config = lib.mkIf config.smartmontools.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ smartmontools ];
        };
    };
}
