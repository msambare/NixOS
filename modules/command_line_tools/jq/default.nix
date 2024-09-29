{ pkgs, lib, config, username, ... }: {

    options = {
        jq.enable = lib.mkEnableOption "enables jq";
    };

    config = lib.mkIf config.jq.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ jq ];
        };
    };
}
