{ pkgs, lib, config, username, ... }: {

    options = {
        iputils.enable = lib.mkEnableOption "enables iputils";
    };

    config = lib.mkIf config.iputils.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ iputils ];
        };
    };
}
