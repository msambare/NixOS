{ pkgs, lib, config, username, ... }: {

    options = {
        anydesk.enable = lib.mkEnableOption "enables anydesk";
    };

    config = lib.mkIf config.anydesk.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ anydesk ];
        };
    };
}
