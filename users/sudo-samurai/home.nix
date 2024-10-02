{ pkgs, ... }: {

  imports = [

    ../base_user.nix
    ./home-module-config

  ];

  programs.git = {
    userName = "msambare";
    userEmail = "mangesh@sambare.in";
  };

  # Add your custom aliases
  programs.fish.aliases = {
    ll = "ls -la";
  };
}