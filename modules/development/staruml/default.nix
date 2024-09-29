{ pkgs, lib, config, username, ... }: {

    options = {
        staruml.enable = lib.mkEnableOption "enables staruml";
    };

    config = lib.mkIf config.staruml.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ staruml ];
        };
    };
}
