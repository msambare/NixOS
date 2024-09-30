{ pkgs, lib, config, username, ... }: {

    options = {
        rawtherapee.enable = lib.mkEnableOption "enables rawtherapee";
    };

    config = lib.mkIf config.rawtherapee.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ rawtherapee ];
        };
    };
}
