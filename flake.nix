{
  description = "NixOS Configuration";

  inputs = {
    
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager-unstable.url = "github:nix-community/home-manager/master";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";

  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  } : {
  
    nixosConfigurations = {
      nixie = let
        system = "x86_64-linux";
        username = "sudo-samurai";
        full_name = "Mangesh Sambare";
        timezone = "Asia/Kolkata";
        locale = "en_IN";
        browsers = [ "vivaldi" "firefox" "brave" "chromium" "tor-browser" ];
        terminals = [ "alacritty" "kitty" ];
        api_clients = [ "insomnia" "postman"];
        archives = [ "gnutar" "p7zip" "unzip" "zip" "xz" ];
        audio = [ "audacity" ];
        backup = [ "borgbackup" "duplicity" "restic" "vorta" ];
        cloud_programs = [ "awscli2" "insync" "rclone" ];
        command_line_programs = [ "fzf" "jq" "ncdu" "neofetch" "nerdfetch" "sshs" "tree" ];
        containerization = [ "docker-compose" ];
        development = [ "python312" "staruml" "sublime-merge" ];
        disk_tools = [ "fio" "gparted" "hdparm" "impression" "iotop" "smartmontools" "sysstat" "usbimager" "ventoy-full" ];
        editors = [ "sublime4" "typora" "vscode-with-extensions" "neovim" "vimPlugins-nvchad-ui" ];
        firewall_security = [ "chkrootkit" "clamav" "fail2ban" ];
        fonts = [ "fira-code" "nerdfonts" ];
        graphics = [ "gimp" "inkscape" ];
        k8s = [ "kubectl" "helm" ];
        load_test = [ "jmeter" "siege" ];
        music = [ "spotify" ];
        networking_tools = [ "dig" "dogdns" "doggo" "drill" "iftop" "inetutils" "iputils" "mtr" "netcat-gnu" "nettools" "nmap" "tcpdump" ];
        office = [ "libreoffice-fresh" "onlyoffice-bin_latest" ];
        password_manager = [ "one_password" ];
        personal_knowledge_management = [ "logseq" "notion-app-enhanced" ];
        photo_tools = [ "darktable" "rawtherapee" ];
        privacy = [ "kleopatra" ];
        productivity = [ "atuin" "thefuck" "zoxide" "fd" ];
        remote_assistance = [ "anydesk" ];
        remote_servers = [ "filezilla" "termius" ];
        system_monitoring = [ "btop" "glances" "htop" "lsof" "nvtop" "virt-top" ];
        system_tools = [ "ethtool" "lm_sensors" "pciutils" "usbutils" ];

        default_browser = "brave";

        specialArgs = {
          inherit system;
          inherit username;
          inherit full_name;
          inherit timezone;
          inherit locale;
          inherit terminals;
          inherit browsers;
          inherit api_clients;
          inherit archives;
          inherit audio;
          inherit backup;
          inherit cloud_programs;
          inherit command_line_programs;
          inherit containerization;
          inherit development;
          inherit disk_tools;
          inherit editors;
          inherit firewall_security;
          inherit fonts;
          inherit graphics;
          inherit k8s;
          inherit load_test;
          inherit music;
          inherit networking_tools;
          inherit office;
          inherit password_manager;
          inherit personal_knowledge_management;
          inherit photo_tools;
          inherit privacy;
          inherit productivity;
          inherit remote_assistance;
          inherit remote_servers;
          inherit system_monitoring;
          inherit system_tools;
          inherit default_browser;
        };
      in
        nixpkgs.lib.nixosSystem {

          inherit specialArgs;
          
          modules = [
            ./hosts/nixie
            ./users/${username}/modules.nix
            
            home-manager.nixosModules.home-manager
            {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}