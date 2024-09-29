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