{ pkgs, lib, config, username, ... }: {

    options = {
        termius.enable = lib.mkEnableOption "enables termius";
    };

    config = lib.mkIf config.termius.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ termius ];
        };
    };
}
