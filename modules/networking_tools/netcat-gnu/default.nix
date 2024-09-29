{ pkgs, lib, config, username, ... }: {

    options = {
        netcat-gnu.enable = lib.mkEnableOption "enables netcat-gnu";
    };

    config = lib.mkIf config.netcat-gnu.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ netcat-gnu ];
        };
    };
}
