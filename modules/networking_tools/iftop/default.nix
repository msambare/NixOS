{ pkgs, lib, config, username, ... }: {

    options = {
        iftop.enable = lib.mkEnableOption "enables iftop";
    };

    config = lib.mkIf config.iftop.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ iftop ];
        };
    };
}
