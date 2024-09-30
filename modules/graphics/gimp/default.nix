{ pkgs, lib, config, username, ... }: {

    options = {
        gimp.enable = lib.mkEnableOption "enables gimp";
    };

    config = lib.mkIf config.gimp.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ gimp-with-plugins ];
        };
    };
}
