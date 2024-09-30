{ pkgs, lib, config, username, ... }: {

    options = {
        jmeter.enable = lib.mkEnableOption "enables jmeter";
    };

    config = lib.mkIf config.jmeter.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ jmeter ];
        };
    };
}
