{ pkgs, lib, config, username, ... }: {

    options = {
        thefuck.enable = lib.mkEnableOption "enables thefuck";
    };

    config = lib.mkIf config.thefuck.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ thefuck ];
        };
    };
}
