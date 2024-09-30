{ pkgs, lib, config, username, ... }: {

    options = {
        virt-manager.enable = lib.mkEnableOption "enables virt-manager";
    };

    config = lib.mkIf config.virt-manager.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ virt-manager ];
        };
    };
}
