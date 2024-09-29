{ pkgs, lib, config, username, ... }: {

    options = {
        duplicity.enable = lib.mkEnableOption "enables duplicity";
    };

    config = lib.mkIf config.duplicity.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ duplicity ];
        };
    };
}
