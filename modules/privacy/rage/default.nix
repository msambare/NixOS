{ pkgs, lib, config, username, ... }: {

    options = {
        rage.enable = lib.mkEnableOption "enables rage";
    };

    config = lib.mkIf config.rage.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ rage ];
        };
    };
}
