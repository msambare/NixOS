{ pkgs, lib, config, username, ... }: {

    options = {
        lm_sensors.enable = lib.mkEnableOption "enables lm_sensors";
    };

    config = lib.mkIf config.lm_sensors.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ lm_sensors ];
        };
    };
}
