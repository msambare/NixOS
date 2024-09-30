{ pkgs, lib, config, username, ... }: {

    options = {
        spotify.enable = lib.mkEnableOption "enables spotify";
    };

    config = lib.mkIf config.spotify.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ spotify ];
        };
    };
}
