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
        api_client = [ "insomnia" "postman" ];
        archives = [ "gnutar" "p7zip" "unzip" "zip" "xz" ];
        audios = [ "audacity" ];
        backups = [ "borgbackup" "duplicity" "restic" "vorta" ];
        browsers = [ "vivaldi" "firefox" "brave" "chromium" "tor-browser" ];
        cloud_tools = [ "awscli" "awscli2" "dropbox-cli" "rclone" ];
        command_line_tools = [ "fzf" "jq" "ncdu" "neofetch" "nerdfetch" "sshs" "tree" ];
        terminals = [ "alacritty" "kitty" ];

        default_browser = "brave";

        specialArgs = {
          inherit system;
          inherit username;
          inherit full_name;
          inherit timezone;
          inherit locale;
          inherit terminals;
          inherit browsers;
          inherit api_client;
          inherit archives;
          inherit audios;
          inherit backups;
          inherit cloud_tools;
          inherit command_line_tools;
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