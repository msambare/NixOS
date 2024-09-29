{ pkgs, lib, config, username, ... }: {

    options = {
        rkhunter.enable = lib.mkEnableOption "enables rkhunter";
    };

    config = lib.mkIf config.rkhunter.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ rkhunter ];
        };
    };
}
