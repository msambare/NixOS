{ pkgs, lib, config, username, ... }: {

    options = {
        fio.enable = lib.mkEnableOption "enables fio";
    };

    config = lib.mkIf config.fio.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ fio ];
        };
    };
}
