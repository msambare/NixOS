{ pkgs, lib, config, username, ... }: {

    options = {
        ncdu.enable = lib.mkEnableOption "enables ncdu";
    };

    config = lib.mkIf config.ncdu.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ ncdu ];
        };
    };
}
