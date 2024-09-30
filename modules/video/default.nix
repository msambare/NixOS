{ pkgs, lib, video, ... }:
let
  functions = import ../functions.nix { inherit pkgs lib; };
  video_options = [ "ffmpeg_7-full" "kdenlive" "obs-studio" "vlc" ];
in
functions.makeModuleConfig {
  options = video_options;
  current = video;
  module_name = "video";
}
