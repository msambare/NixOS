{ nixpkgs-unstable, lib, config, username, ... }: {

    options = {
        rambox.enable = lib.mkEnableOption "enables rambox";
    };

    config = lib.mkIf config.rambox.enable  {
        home-manager.users.${username} = {nixpkgs-unstable, ... }: {
            home.packages = with nixpkgs-unstable; [ rambox ];
        };
    };
}
