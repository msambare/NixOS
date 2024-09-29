{ pkgs, lib, config, username, ... }: {

    options = {
        docker.enable = lib.mkEnableOption "enables docker";
    };

    config = lib.mkIf config.docker.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ docker ];

            virtualisation.docker = {
            enable = true;
                rootless = {
                enable = true;
                setSocketVariable = true;
                };
            };
        };
    };
}
