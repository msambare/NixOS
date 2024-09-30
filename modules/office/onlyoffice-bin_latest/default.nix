{ pkgs, lib, config, username, ... }: {

    options = {
        onlyoffice-bin_latest.enable = lib.mkEnableOption "enables onlyoffice-bin_latest";
    };

    config = lib.mkIf config.onlyoffice-bin_latest.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ onlyoffice-bin_latest ];
        };
    };
}
