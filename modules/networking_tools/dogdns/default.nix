{ pkgs, lib, config, username, ... }: {

    options = {
        dogdns.enable = lib.mkEnableOption "enables dogdns";
    };

    config = lib.mkIf config.dogdns.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ dogdns ];
        };
    };
}
