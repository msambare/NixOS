{ pkgs, lib, config, username, ... }: {

    options = {
        xclip.enable = lib.mkEnableOption "enables xclip";
    };

    config = lib.mkIf config.xclip.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ xclip ];
        };
    };
}
