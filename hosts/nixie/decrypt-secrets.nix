{ pkgs, config, lib, ... }:

let
  user = builtins.head (lib.filter (u: u.name != "root") (builtins.attrValues config.users.users));
  homeDir = user.home;
  agePrivateKeyFile = "${homeDir}/.sops/age/keys.txt";
  decryptedDir = "/run/secrets";
in
{
  sops = {
    defaultSopsFile = ./secrets/secrets.enc.yaml;
    age.keyFile = agePrivateKeyFile;
  };

  sops.secrets = {
    "sshKeys/id_rsa" = {
      path = "${homeDir}/.ssh/id_rsa";
      owner = user.name;
      mode = "0400";
    };
    "sshKeys/id_ed25519" = {
      path = "${homeDir}/.ssh/id_ed25519";
      owner = user.name;
      mode = "0400";
    };
  };

  users.users.${user.name}.openssh.authorizedKeys.keys = [
    (builtins.readFile config.sops.secrets."sshKeys/id_rsa".path)
    (builtins.readFile config.sops.secrets."sshKeys/id_ed25519".path)
  ];

  networking.wireless.networks = builtins.mapAttrs (name: value: {
    pskFile = config.sops.secrets."wifiPasswords/${name}".path;
  }) (builtins.fromJSON (builtins.readFile config.sops.secrets."wifiPasswords".path));

  sops.secrets = builtins.mapAttrs (name: value: {
    path = "${decryptedDir}/wpa_supplicant_${name}.conf";
  }) (builtins.fromJSON (builtins.readFile config.sops.secrets."wifiPasswords".path));
}
