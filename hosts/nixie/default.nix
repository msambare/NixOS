# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./decrypt-secrets.nix
    ];

  systemd.tmpfiles.rules = 
    [
      "d /run/secrets 0700 root root"  # Ensure the /run/secrets directory has the right permissions
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixie"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sudo-samurai = {
  isNormalUser = true;
  description = "Mangesh Sambare";
  extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd"];
  packages = with pkgs; [
    kdePackages.kate
  #  thunderbird
  ];

  # Dynamically use SSH public keys and private keys from the decrypted secrets
  let
    # Load and parse the decrypted secrets file
    secrets = builtins.fromJSON (builtins.readFile "/run/secrets/secrets.yaml");

    # Extract the SSH keys from the secrets
    sshKeys = secrets.sshKeys;

    # Get the id_rsa and id_ed25519 key objects
    idRsaKey = builtins.head (builtins.filter (key: key.name == "id_rsa") sshKeys);
    idEd25519Key = builtins.head (builtins.filter (key: key.name == "id_ed25519") sshKeys);

  in {
    # Use the public keys for SSH access
    openssh.authorizedKeys.keys = [
      idRsaKey.publicKey
      idEd25519Key.publicKey
    ];

    # Dynamically place SSH private keys from decrypted secrets
    extraFiles = {
      ".ssh/id_rsa" = {
        source = "/run/secrets/secrets.yaml";
        content = idRsaKey.privateKey;
        permissions = "0400";
      };
      ".ssh/id_ed25519" = {
        source = "/run/secrets/secrets.yaml";
        content = idEd25519Key.privateKey;
        permissions = "0400";
      };
    };
  };

  # Reference the dynamically created WiFi password files
  networking.wireless.networks = {
    "Dracarys5G" = {
      pskFile = "/run/secrets/wpa_supplicant_Dracarys5G.conf";
    };
    "Dracarys5-1G" = {
      pskFile = "/run/secrets/wpa_supplicant_Dracarys5-1G.conf";
    };
    "Dracarys2-4G" = {
      pskFile = "/run/secrets/wpa_supplicant_Dracarys2-4G.conf";
    };
    "Jio2-4G" = {
      pskFile = "/run/secrets/wpa_supplicant_Jio2-4G.conf";
    };
    "Jio5G" = {
      pskFile = "/run/secrets/wpa_supplicant_Jio5G.conf";
    };
    "BangBang2-4G" = {
      pskFile = "/run/secrets/wpa_supplicant_BangBang2-4G.conf";
    };
    "BangBang5G" = {
      pskFile = "/run/secrets/wpa_supplicant_BangBang5G.conf";
    };
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    sops
  ];

  # install and enable docker
  virtualisation.docker.enable = true;

  # run docker in rootless mode. Note that you cannot bind ports bwlow 1024
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # libvirt configuration
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };

  # allow nested virtualization
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  # allowed insecre package
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11" # logseq
    "openssl-1.1.1w" # sublime4
    "python-2.7.18.8" # xtrlock-pam
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}