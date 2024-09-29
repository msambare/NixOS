{ pkgs, lib, config, username, ... }: {

    options = {
        xz.enable = lib.mkEnableOption "enables xz";
    };

    config = lib.mkIf config.xz.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ xz ];
        };
    };
}
