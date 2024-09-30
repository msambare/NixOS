{ pkgs, lib, config, username, ... }: {

    options = {
        notion-app-enhanced.enable = lib.mkEnableOption "enables notion-app-enhanced";
    };

    config = lib.mkIf config.notion-app-enhanced.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ notion-app-enhanced ];
        };
    };
}
