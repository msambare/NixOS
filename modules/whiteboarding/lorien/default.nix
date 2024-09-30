{ pkgs, lib, config, username, ... }: {

    options = {
        lorien.enable = lib.mkEnableOption "enables lorien";
    };

    config = lib.mkIf config.lorien.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ lorien ];
        };
    };
}
