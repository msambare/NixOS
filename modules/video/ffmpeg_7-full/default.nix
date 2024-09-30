{ pkgs, lib, config, username, ... }: {

    options = {
        ffmpeg_7-full.enable = lib.mkEnableOption "enables ffmpeg_7-full";
    };

    config = lib.mkIf config.ffmpeg_7-full.enable  {
        home-manager.users.${username} = {pkgs, ... }: {
            home.packages = with pkgs; [ ffmpeg_7-full ];
        };
    };
}
