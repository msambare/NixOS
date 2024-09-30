{ pkgs, lib, config, username, ... }: {

    options = {
        nvtop.enable = lib.mkEnableOption "enables nvtop";
    };

    config = lib.mkIf config.nvtop.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ nvtopPackages.full ];
        };
    };
}
