{ pkgs, lib, config, username, ... }: {

    options = {
        docker-compose.enable = lib.mkEnableOption "enables docker-compose";
    };

    config = lib.mkIf config.docker-compose.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ docker-compose ];
        };
    };
}
