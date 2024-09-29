{ pkgs, lib, config, username, ... }: {

    options = {
        audacity.enable = lib.mkEnableOption "enables audacity";
    };

    config = lib.mkIf config.audacity.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ audacity ];
        };
    };
}
