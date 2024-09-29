{ pkgs, lib, config, username, ... }: {

    options = {
        drill.enable = lib.mkEnableOption "enables drill";
    };

    config = lib.mkIf config.drill.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ drill ];
        };
    };
}
