{ pkgs_unstable, lib, config, username, ... }: {

    options = {
        rambox.enable = lib.mkEnableOption "enables rambox";
    };

    config = lib.mkIf config.rambox.enable  {
        home-manager.users.${username} = { pkgs_unstable, ... }: {
            home.packages = with pkgs_unstable; [ rambox ];
        };
    };
}
