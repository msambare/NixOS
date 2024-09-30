{ pkgs, lib, config, username, ... }: {

    options = {
        logseq.enable = lib.mkEnableOption "enables logseq";
    };

    config = lib.mkIf config.logseq.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ logseq ];

            permittedInsecurePackages = [
                "electron-27.3.11"
              ];
        };
    };
}
