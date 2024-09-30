{ pkgs, lib, config, username, ... }: {

    options = {
        ulauncher.enable = lib.mkEnableOption "enables ulauncher";
    };

    config = lib.mkIf config.ulauncher.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ ulauncher ];
        };
    };
}
