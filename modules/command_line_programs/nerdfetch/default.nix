{ pkgs, lib, config, username, ... }: {

    options = {
        nerdfetch.enable = lib.mkEnableOption "enables nerdfetch";
    };

    config = lib.mkIf config.nerdfetch.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ nerdfetch ];
        };
    };
}
