{ pkgs, lib, config, username, ... }: {

    options = {
        rclone.enable = lib.mkEnableOption "enables rclone";
    };

    config = lib.mkIf config.rclone.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ rclone ];
        };
    };
}
