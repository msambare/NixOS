{ pkgs, config, lib, ... }:

let
  user = builtins.head (lib.filter (u: u.name != "root") (builtins.attrValues config.users.users));
  homeDir = user.home;
  agePrivateKeyFile = "${homeDir}/.sops/age/keys.txt";
  decryptedDir = "/run/secrets";
  wifiPasswords = builtins.fromJSON (builtins.readFile "/run/secrets/secrets.yaml").wifiPasswords;
in
{
  systemd.services.decrypt-secrets = {
    description = "Decrypt NixOS Secrets (SSH Keys and WiFi Passwords)";
    before = [ "network-pre.target" ];  # Ensure it runs before network setup
    wantedBy = [ "sysinit.target" ];

    serviceConfig = {
      Environment = "SOPS_AGE_KEY_FILE=${agePrivateKeyFile}";  # Set the SOPS_AGE_KEY_FILE variable to point to the key
      ExecStart = "${pkgs.sops}/bin/sops --decrypt /etc/nixos/secrets/secrets.enc.yaml > ${decryptedDir}/secrets.yaml";
      ExecStartPost = ''
        ${pkgs.bash}/bin/bash -c 'chmod 600 ${decryptedDir}/secrets.yaml'

        # Dynamically create WiFi password files from decrypted secrets
        echo "${builtins.getAttr "Dracarys5G" wifiPasswords}" > ${decryptedDir}/wpa_supplicant_Dracarys5G.conf
        echo "${builtins.getAttr "Dracarys5-1G" wifiPasswords}" > ${decryptedDir}/wpa_supplicant_Dracarys5-1G.conf
        echo "${builtins.getAttr "Dracarys2-4G" wifiPasswords}" > ${decryptedDir}/wpa_supplicant_Dracarys2-4G.conf
        echo "${builtins.getAttr "Jio2-4G" wifiPasswords}" > ${decryptedDir}/wpa_supplicant_Jio2-4G.conf
        echo "${builtins.getAttr "Jio5G" wifiPasswords}" > ${decryptedDir}/wpa_supplicant_Jio5G.conf
        echo "${builtins.getAttr "BangBang2-4G" wifiPasswords}" > ${decryptedDir}/wpa_supplicant_BangBang2-4G.conf
        echo "${builtins.getAttr "BangBang5G" wifiPasswords}" > ${decryptedDir}/wpa_supplicant_BangBang5G.conf

        chmod 600 ${decryptedDir}/wpa_supplicant_Dracarys5G.conf
        chmod 600 ${decryptedDir}/wpa_supplicant_Dracarys5-1G.conf
        chmod 600 ${decryptedDir}/wpa_supplicant_Dracarys2-4G.conf
        chmod 600 ${decryptedDir}/wpa_supplicant_Jio2-4G.conf
        chmod 600 ${decryptedDir}/wpa_supplicant_Jio5G.conf
        chmod 600 ${decryptedDir}/wpa_supplicant_BangBang2-4G.conf
        chmod 600 ${decryptedDir}/wpa_supplicant_BangBang5G.conf
      '';
    };

    preStart = ''
      mkdir -p ${decryptedDir}
    '';
    restartIfChanged = false;
  };
}
