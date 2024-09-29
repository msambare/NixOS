{ pkgs, lib, config, username, ... }: {

    options = {
        awscli.enable = lib.mkEnableOption "enables awscli";
    };

    config = lib.mkIf config.awscli.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ awscli ];
        };
    };
}
