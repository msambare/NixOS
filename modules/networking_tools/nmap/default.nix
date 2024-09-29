{ pkgs, lib, config, username, ... }: {

    options = {
        nmap.enable = lib.mkEnableOption "enables nmap";
    };

    config = lib.mkIf config.nmap.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ nmap ];
        };
    };
}
