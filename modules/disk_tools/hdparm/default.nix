{ pkgs, lib, config, username, ... }: {

    options = {
        hdparm.enable = lib.mkEnableOption "enables hdparm";
    };

    config = lib.mkIf config.hdparm.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ hdparm ];
        };
    };
}
