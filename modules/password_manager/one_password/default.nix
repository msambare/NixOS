{ pkgs, lib, config, username, ... }: {

    options = {
        one_password.enable = lib.mkEnableOption "enables one_password";
    };

    config = lib.mkIf config.one_password.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ _1password-gui _1password ];
        };
    };
}
