{ pkgs, lib, config, username, ... }: {

    options = {
        lxcfs.enable = lib.mkEnableOption "enables lxcfs";
    };

    config = lib.mkIf config.lxcfs.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ lxcfs ];
        };
    };
}
