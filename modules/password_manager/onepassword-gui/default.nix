{ pkgs, lib, config, username, ... }: {

    options = {
        onepassword-gui.enable = lib.mkEnableOption "enables 1password-gui";
    };

    config = lib.mkIf config.onepassword-gui.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ _1password-gui ];
        };
    };
}
