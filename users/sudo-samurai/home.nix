{ pkgs, pkgs-unstable, ... }: {

  imports = [

    ../base_user.nix
    ./home-module-config

  ];

  programs.git = {
    userName = "msambare";
    userEmail = "mangesh@sambare.in";
  };

}