{ pkgs, lib, config, username, ... }: {

    options = {
        clamav.enable = lib.mkEnableOption "enables clamav";
    };

    config = lib.mkIf config.clamav.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ clamav ];
        };
    };
}
