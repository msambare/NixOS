{ pkgs, lib, config, username, ... }: {

    options = {
        age.enable = lib.mkEnableOption "enables age";
    };

    config = lib.mkIf config.age.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ age ];
        };
    };
}
