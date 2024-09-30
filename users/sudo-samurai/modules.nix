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
    ../../modules/firewall_security
    ../../modules/fonts
    ../../modules/graphics
    ../../modules/k8s
    ../../modules/load_test
    ../../modules/music
    ../../modules/networking_tools
    ../../modules/office
    ../../modules/password_manager
    ../../modules/personal_knowledge_management
    ../../modules/photo_tools
    ../../modules/privacy
    ../../modules/productivity
    ../../modules/remote_assistance
    ../../modules/remote_server
    ../../modules/system_monitoring
    ../../modules/system_tools
    ../../modules/terminal_multiplexers
    ../../modules/torrent_clients
    ../../modules/unified_communication
    ../../modules/utility
  ];

}
