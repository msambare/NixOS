{ pkgs, lib, config, username, ... }: {

    options = {
        insomnia.enable = lib.mkEnableOption "enables insomnia";
    };

    config = lib.mkIf config.insomnia.enable {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ insomnia ];
        };
    };
}