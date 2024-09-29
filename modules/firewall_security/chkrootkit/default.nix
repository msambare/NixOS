{ pkgs, lib, config, username, ... }: {

    options = {
        chkrootkit.enable = lib.mkEnableOption "enables chkrootkit";
    };

    config = lib.mkIf config.chkrootkit.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ chkrootkit ];
        };
    };
}
