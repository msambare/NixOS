{ pkgs, lib, config, username, ... }: {

    options = {
        copyq.enable = lib.mkEnableOption "enables copyq";
    };

    config = lib.mkIf config.copyq.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ copyq ];
        };
    };
}
