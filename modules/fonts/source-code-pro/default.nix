{ pkgs, lib, config, username, ... }: {

    options = {
        source-code-pro.enable = lib.mkEnableOption "enables source-code-pro";
    };

    config = lib.mkIf config.source-code-pro.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ source-code-pro ];
        };
    };
}
