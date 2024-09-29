{ pkgs, lib, config, username, ... }: {

    options = {
        sublime4.enable = lib.mkEnableOption "enables sublime4";
    };

    config = lib.mkIf config.sublime4.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ sublime4 ];
        };

        nixpkgs.config.permittedInsecurePackages = [
            "openssl-1.1.1w"
        ];
    };
}
