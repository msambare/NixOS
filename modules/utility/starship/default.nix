{ pkgs, lib, config, username, ... }: {

    options = {
        starship.enable = lib.mkEnableOption "enables starship";
    };

    config = lib.mkIf config.starship.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ starship ];
        };
    };
}
