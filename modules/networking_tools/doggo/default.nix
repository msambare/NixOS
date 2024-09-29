{ pkgs, lib, config, username, ... }: {

    options = {
        doggo.enable = lib.mkEnableOption "enables doggo";
    };

    config = lib.mkIf config.doggo.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ doggo ];
        };
    };
}
