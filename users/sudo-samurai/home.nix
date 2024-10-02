{ pkgs, ... }: {

  imports = [

    ../base_user.nix
    ./home-module-config

  ];

  programs.git = {
    userName = "msambare";
    userEmail = "mangesh@sambare.in";
  };

  # Enable fish in the user's environment
  programs.fish.enable = true;

  # Set fish as the default shell for this user
  home.shell = pkgs.fish;

}