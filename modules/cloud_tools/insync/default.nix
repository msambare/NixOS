{ pkgs, lib, config, username, ... }: {

    options = {
        insync.enable = lib.mkEnableOption "enables insync";
    };

    config = lib.mkIf config.insync.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ insync ];
        };
    };
}
