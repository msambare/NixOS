{ pkgs, lib, config, username, ... }: {

    options = {
        bridge-utils.enable = lib.mkEnableOption "enables bridge-utils";
    };

    config = lib.mkIf config.bridge-utils.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ bridge-utils ];
        };
    };
}
