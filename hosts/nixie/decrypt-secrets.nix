{ config, lib, pkgs, ... }:

let
  decryptedDir = "/run/secrets";
  secretsFile = ./secrets.enc.yaml;
  keys = [ "/etc/ssh/ssh_host_ed25519_key" ];
in
{
  sops = {
    defaultSopsFile = secretsFile;
    age.sshKeyPaths = keys;
  };

  sops.secrets = {
    "ssh/id_ed25519" = {
      path = "${decryptedDir}/id_ed25519";
      mode = "0600";
      owner = config.users.users.sudo-samurai.name;
    };
    "ssh/id_ed25519.pub" = {
      path = "${decryptedDir}/id_ed25519.pub";
      mode = "0644";
      owner = config.users.users.sudo-samurai.name;
    };
  } // (builtins.mapAttrs (name: value: {
    path = "${decryptedDir}/wpa_supplicant_${name}.conf";
    mode = "0600";
    owner = "root";
  }) (builtins.fromJSON (builtins.readFile secretsFile)).wifi_passwords);

  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    networks = builtins.mapAttrs (name: value: {
      psk = "@${decryptedDir}/wpa_supplicant_${name}.conf@";
    }) (builtins.fromJSON (builtins.readFile secretsFile)).wifi_passwords;
  };

  systemd.services.wpa_supplicant.preStart = ''
    ${lib.concatMapStrings (name: ''
      if [ ! -f "${decryptedDir}/wpa_supplicant_${name}.conf" ]; then
        echo "Error: ${decryptedDir}/wpa_supplicant_${name}.conf not found"
        exit 1
      fi
    '') (builtins.attrNames (builtins.fromJSON (builtins.readFile secretsFile)).wifi_passwords)}
  '';
}