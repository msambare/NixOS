{ pkgs, lib, config, username, ... }: {

    options = {
        sshs.enable = lib.mkEnableOption "enables sshs";
    };

    config = lib.mkIf config.sshs.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ sshs ];
        };
    };
}
