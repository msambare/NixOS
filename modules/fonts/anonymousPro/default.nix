{ pkgs, lib, config, username, ... }: {

    options = {
        anonymousPro.enable = lib.mkEnableOption "enables anonymousPro";
    };

    config = lib.mkIf config.anonymousPro.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ anonymousPro ];
        };
    };
}
