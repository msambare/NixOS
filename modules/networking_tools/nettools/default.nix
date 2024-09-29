{ pkgs, lib, config, username, ... }: {

    options = {
        nettools.enable = lib.mkEnableOption "enables nettools";
    };

    config = lib.mkIf config.nettools.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ nettools ];
        };
    };
}
