{ pkgs, lib, config, username, ... }: {

    options = {
        pciutils.enable = lib.mkEnableOption "enables pciutils";
    };

    config = lib.mkIf config.pciutils.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ pciutils ];
        };
    };
}
