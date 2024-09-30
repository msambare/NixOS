{ pkgs, lib, config, username, ... }: {

    options = {
        kdenlive.enable = lib.mkEnableOption "enables kdenlive";
    };

    config = lib.mkIf config.kdenlive.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ kdePackages.kdenlive ];
        };
    };
}
