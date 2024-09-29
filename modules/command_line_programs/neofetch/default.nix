{ pkgs, lib, config, username, ... }: {

    options = {
        neofetch.enable = lib.mkEnableOption "enables neofetch";
    };

    config = lib.mkIf config.neofetch.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ neofetch ];
        };
    };
}
