{ pkgs, lib, config, username, ... }: {

    options = {
        dig.enable = lib.mkEnableOption "enables dig";
    };

    config = lib.mkIf config.dig.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ dig ];
        };
    };
}
