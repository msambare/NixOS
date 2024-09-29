{ pkgs, lib, config, username, ... }: {

    options = {
        ventoy-full.enable = lib.mkEnableOption "enables ventoy-full";
    };

    config = lib.mkIf config.ventoy-full.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ ventoy-full ];
        };
    };
}
