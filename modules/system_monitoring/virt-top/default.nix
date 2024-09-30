{ pkgs, lib, config, username, ... }: {

    options = {
        virt-top.enable = lib.mkEnableOption "enables virt-top";
    };

    config = lib.mkIf config.virt-top.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ virt-top ];
        };
    };
}
