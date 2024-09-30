{ pkgs, lib, config, username, ... }: {

    options = {
        stremio.enable = lib.mkEnableOption "enables stremio";
    };

    config = lib.mkIf config.stremio.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ stremio ];
        };
    };
}
