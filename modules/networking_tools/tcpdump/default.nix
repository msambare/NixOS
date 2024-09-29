{ pkgs, lib, config, username, ... }: {

    options = {
        tcpdump.enable = lib.mkEnableOption "enables tcpdump";
    };

    config = lib.mkIf config.tcpdump.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ tcpdump ];
        };
    };
}
