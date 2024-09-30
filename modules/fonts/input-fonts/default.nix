{ pkgs, lib, config, username, ... }: {

    options = {
        input-fonts.enable = lib.mkEnableOption "enables input-fonts";
    };

    config = lib.mkIf config.input-fonts.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ input-fonts ];
        };
    };
}
