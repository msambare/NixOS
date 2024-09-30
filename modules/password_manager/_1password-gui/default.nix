{ pkgs, lib, config, username, ... }: {

    options = {
        _1password-gui.enable = lib.mkEnableOption "enables _1password-gui";
    };

    config = lib.mkIf config._1password-gui.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ _1password-gui ];
        };
    };
}
