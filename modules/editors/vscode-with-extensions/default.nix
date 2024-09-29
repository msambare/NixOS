{ pkgs, lib, config, username, ... }: {

    options = {
        vscode-with-extensions.enable = lib.mkEnableOption "enables vscode-with-extensions";
    };

    config = lib.mkIf config.vscode-with-extensions.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ vscode-with-extensions ];
        };
    };
}
