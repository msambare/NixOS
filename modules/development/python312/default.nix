{ pkgs, lib, config, username, ... }: {

    options = {
        python312.enable = lib.mkEnableOption "enables python312";
    };

    config = lib.mkIf config.python312.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ python312 ];
        };
    };
}
