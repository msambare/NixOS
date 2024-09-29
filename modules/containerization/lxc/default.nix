{ pkgs, lib, config, username, ... }: {

    options = {
        lxc.enable = lib.mkEnableOption "enables lxc";
    };

    config = lib.mkIf config.lxc.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ lxc ];
        };
    };
}
