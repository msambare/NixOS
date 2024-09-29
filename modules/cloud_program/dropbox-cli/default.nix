{ pkgs, lib, config, username, ... }: {

    options = {
        dropbox-cli.enable = lib.mkEnableOption "enables dropbox-cli";
    };

    config = lib.mkIf config.dropbox-cli.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ dropbox-cli ];
        };
    };
}
