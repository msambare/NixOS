{ pkgs, lib, config, username, ... }: {

    options = {
        tmux.enable = lib.mkEnableOption "enables tmux";
    };

    config = lib.mkIf config.tmux.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ tmux ];
        };
    };
}
