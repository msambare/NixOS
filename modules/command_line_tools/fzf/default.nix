{ pkgs, lib, config, username, ... }: {

    options = {
        fzf.enable = lib.mkEnableOption "enables fzf";
    };

    config = lib.mkIf config.fzf.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ fzf ];
        };
    };
}
