{ pkgs, ... }: {

  imports = [
    ../../modules/browser
    ../../modules/terminal
    ../../modules/api_client
    ../../modules/archive
    ../../modules/audio
    ../../modules/backup
    ../../modules/cloud_program
    ../../modules/command_line_programs
    ../../modules/containerization
    ../../modules/development
    ../../modules/disk_tools
    ../../modules/editors
  ];

}
