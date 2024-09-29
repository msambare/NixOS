{ pkgs, lib, config, username, ... }: {

    options = {
        nerdfonts.enable = lib.mkEnableOption "enables nerdfonts";
    };

    config = lib.mkIf config.nerdfonts.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ nerdfonts ];
        };
    };
}
