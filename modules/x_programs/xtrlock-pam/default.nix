{ pkgs, lib, config, username, ... }: {

    options = {
        xtrlock-pam.enable = lib.mkEnableOption "enables xtrlock-pam";
    };

    config = lib.mkIf config.xtrlock-pam.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ xtrlock-pam ];
        };
    };
}
