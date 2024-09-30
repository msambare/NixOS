{ pkgs, lib, config, username, ... }: {

    options = {
        ethtool.enable = lib.mkEnableOption "enables ethtool";
    };

    config = lib.mkIf config.ethtool.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ ethtool ];
        };
    };
}
