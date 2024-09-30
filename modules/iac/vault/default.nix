{ pkgs, lib, config, username, ... }: {

    options = {
        vault.enable = lib.mkEnableOption "enables vault";
    };

    config = lib.mkIf config.vault.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ vault ];
        };
    };
}
