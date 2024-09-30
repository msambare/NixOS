{ pkgs, lib, config, username, ... }: {

    options = {
        helm.enable = lib.mkEnableOption "enables helm";
    };

    config = lib.mkIf config.helm.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ kubernetes-helm ];
        };
    };
}
