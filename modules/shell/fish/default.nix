{ pkgs, lib, config, username, ... }: {

    options = {
        fish.enable = lib.mkEnableOption "enables fish";
    };

    config = lib.mkIf config.fish.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ fish ];
        };
    };
}
