{ pkgs, lib, config, username, ... }: {

    options = {
        terraform.enable = lib.mkEnableOption "enables terraform";
    };

    config = lib.mkIf config.terraform.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ terraform ];
        };
    };
}
