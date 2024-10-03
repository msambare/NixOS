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
    nixpkgs-unstable,
    home-manager,
    ...
  } : {
  
    nixosConfigurations = {
      nixie = let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system}
        {
          config.allowUnfree = true;
        };
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        # {
        #   config.allowUnfree = true;
        # };
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
        cloud_programs = [ "awscli2" "insync" "rclone" "maestral" ];
        command_line_programs = [ "fzf" "jq" "ncdu" "neofetch" "nerdfetch" "sshs" "tree" ];
        containerization = [ "docker-compose" ];
        development = [ "python312" "staruml" "sublime-merge" ];
        disk_tools = [ "fio" "gparted" "hdparm" "impression" "iotop" "smartmontools" "sysstat" "usbimager" "ventoy-full" ];
        editors = [ "sublime4" "typora" "vscode-with-extensions" "neovim" "vimPlugins-nvchad-ui" ];
        firewall_security = [ "chkrootkit" "clamav" "fail2ban" ];
        fonts = [ "fira-code" "nerdfonts" "anonymousPro" "mononoki" "source-code-pro" ];
        graphics = [ "gimp" "inkscape" ];
        k8s = [ "kubectl" "helm" ];
        load_test = [ "jmeter" "siege" ];
        music = [ "spotify" ];
        networking_tools = [ "dig" "dogdns" "doggo" "drill" "iftop" "inetutils" "iputils" "mtr" "netcat-gnu" "nettools" "nmap" "tcpdump" ];
        office = [ "libreoffice-fresh" "onlyoffice-bin_latest" ];
        password_manager = [ "one_password" ];
        personal_knowledge_management = [ "logseq" "notion-app-enhanced" ];
        photo_tools = [ "darktable" "rawtherapee" ];
        privacy = [ "kleopatra" "age" "rage" ];
        productivity = [ "atuin" "thefuck" "zoxide" "fd" ];
        remote_assistance = [ "anydesk" ];
        remote_servers = [ "filezilla" "termius" ];
        system_monitoring = [ "btop" "glances" "htop" "lsof" "nvtop" "virt-top" ];
        system_tools = [ "ethtool" "lm_sensors" "pciutils" "usbutils" ];
        terminal_multiplexers = [ "tmux" "zellij" ];
        torrent_clients = [ "deluge" "stremio" ];
        unified_communication = [ "zoom-us" ];
        utility = [ "copyq" "flameshot" "rambox" "ulauncher" "stow" ];
        video = [ "ffmpeg_7-full" "kdenlive" "obs-studio" "vlc" ];
        virtualization = [ "bridge-utils" "virt-manager" ];
        whiteboarding = [ "lorien" ];
        x_programs = [ "xclip" "xtrlock-pam" ];

        default_browser = "brave";

        specialArgs = {
          inherit system;
          inherit pkgs-unstable;
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
          inherit terminal_multiplexers;
          inherit torrent_clients;
          inherit unified_communication;
          inherit utility;
          inherit video;
          inherit virtualization;
          inherit whiteboarding;
          inherit x_programs;

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