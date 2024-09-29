{ pkgs, lib, config, username, ... }: {

    options = {
        unzip.enable = lib.mkEnableOption "enables unzip";
    };

    config = lib.mkIf config.unzip.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ unzip ];
        };
    };
}
