{ pkgs, lib, config, username, ... }: {

    options = {
        htop.enable = lib.mkEnableOption "enables htop";
    };

    config = lib.mkIf config.htop.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ htop ];
        };
    };
}
