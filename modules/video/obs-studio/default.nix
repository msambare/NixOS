{ pkgs, lib, config, username, ... }: {

    options = {
        obs-studio.enable = lib.mkEnableOption "enables obs-studio";
    };

    config = lib.mkIf config.obs-studio.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ obs-studio ];
        };
    };
}
