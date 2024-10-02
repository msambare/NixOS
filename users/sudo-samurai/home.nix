{ pkgs, ... }: {

  imports = [

    ../base_user.nix
    ./home-module-config

  ];

  programs.git = {
    userName = "msambare";
    userEmail = "mangesh@sambare.in";
  };

  #programs.fish.enable = true;

  # Add your custom aliases
  # programs.fish.aliases = {
  #   ll = "ls -la";
  #   gst = "git status";
  #   .. = "cd ..";
  # };

}