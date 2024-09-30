{ pkgs, lib, config, username, ... }: {

    options = {
        glances.enable = lib.mkEnableOption "enables glances";
    };

    config = lib.mkIf config.glances.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ glances ];
        };
    };
}
