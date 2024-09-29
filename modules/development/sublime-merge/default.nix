{ pkgs, lib, config, username, ... }: {

    options = {
        sublime-merge.enable = lib.mkEnableOption "enables sublime-merge";
    };

    config = lib.mkIf config.sublime-merge.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ sublime-merge ];
        };
    };
}
