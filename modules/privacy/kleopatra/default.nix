{ pkgs, lib, config, username, ... }: {

    options = {
        kleopatra.enable = lib.mkEnableOption "enables kleopatra";
    };

    config = lib.mkIf config.kleopatra.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ kdePackages.kleopatra ];
        };
    };
}
