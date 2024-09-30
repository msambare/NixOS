{ pkgs, lib, config, username, ... }: {

    options = {
        inkscape.enable = lib.mkEnableOption "enables inkscape";
    };

    config = lib.mkIf config.inkscape.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ inkscape-with-extensions ];
        };
    };
}
