{ pkgs, lib, config, username, ... }: {

    options = {
        lsof.enable = lib.mkEnableOption "enables lsof";
    };

    config = lib.mkIf config.lsof.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ lsof ];
        };
    };
}
