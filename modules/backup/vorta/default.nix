{ pkgs, lib, config, username, ... }: {

    options = {
        vorta.enable = lib.mkEnableOption "enables vorta";
    };

    config = lib.mkIf config.vorta.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ vorta ];
        };
    };
}
