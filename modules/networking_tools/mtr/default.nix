{ pkgs, lib, config, username, ... }: {

    options = {
        mtr.enable = lib.mkEnableOption "enables mtr";
    };

    config = lib.mkIf config.mtr.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ mtr ];
        };
    };
}
