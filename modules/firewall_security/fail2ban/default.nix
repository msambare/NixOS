{ pkgs, lib, config, username, ... }: {

    options = {
        fail2ban.enable = lib.mkEnableOption "enables fail2ban";
    };

    config = lib.mkIf config.fail2ban.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ fail2ban ];
        };
    };
}
