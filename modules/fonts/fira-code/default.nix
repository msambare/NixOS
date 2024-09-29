{ pkgs, lib, config, username, ... }: {

    options = {
        fira-code.enable = lib.mkEnableOption "enables fira-code";
    };

    config = lib.mkIf config.fira-code.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ fira-code ];
        };
    };
}
