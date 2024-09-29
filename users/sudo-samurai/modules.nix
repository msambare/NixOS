{ pkgs, ... }: {

  imports = [
    ../../modules/api_client
    ../../modules/archive
    ../../modules/audio
    ../../modules/backup
    ../../modules/browser
    ../../modules/cloud_tool
    ../../modules/command_line_tool
    ../../modules/terminal
  ];

}
