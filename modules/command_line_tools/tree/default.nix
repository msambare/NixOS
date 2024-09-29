{ pkgs, lib, config, username, ... }: {

    options = {
        tree.enable = lib.mkEnableOption "enables tree";
    };

    config = lib.mkIf config.tree.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ tree ];
        };
    };
}
