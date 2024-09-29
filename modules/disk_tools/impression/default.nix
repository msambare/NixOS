{ pkgs, lib, config, username, ... }: {

    options = {
        impression.enable = lib.mkEnableOption "enables impression";
    };

    config = lib.mkIf config.impression.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ impression ];
        };
    };
}
