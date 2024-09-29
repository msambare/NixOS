{ pkgs, lib, config, username, ... }: {

    options = {
        awscli2.enable = lib.mkEnableOption "enables awscli2";
    };

    config = lib.mkIf config.awscli2.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ awscli2 ];
        };
    };
}
