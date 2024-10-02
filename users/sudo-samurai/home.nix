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
  pkgs.fish.aliases = {
    ll = "ls -la";
    gst = "git status";
    .. = "cd ..";
  };
}