{ pkgs, lib, config, username, ... }: {

    options = {
        kubectl.enable = lib.mkEnableOption "enables kubectl";
    };

    config = lib.mkIf config.kubectl.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ kubectl ];
        };
    };
}
