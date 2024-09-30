{ pkgs, lib, config, username, ... }: {

    options = {
        fd.enable = lib.mkEnableOption "enables fd";
    };

    config = lib.mkIf config.fd.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ fd ];
        };
    };
}
