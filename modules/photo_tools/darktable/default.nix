{ pkgs, lib, config, username, ... }: {

    options = {
        darktable.enable = lib.mkEnableOption "enables darktable";
    };

    config = lib.mkIf config.darktable.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ darktable ];
        };
    };
}
