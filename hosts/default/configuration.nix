# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "architect"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  # # Setting up fonts
  # fonts.packages = with pkgs; [ 
  #   # pkgs.nerd-fonts.jetbrains-mono
  #   # pkgs.inter
  #   # pkgs.crimson-pro
  #   # pkgs.noto-fonts-emoji
  # ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
    options = "compose:ralt";
  };

  ## Nvidia graphics config
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    #Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
      # extraPackages = with pkgs; [ mesa ];
    };

    # Brightness control
    # brillo.enable = true;

    # Scanner stuff
    sane = {
      enable = true;
      extraBackends = [ 
        pkgs.sane-airscan
        pkgs.hplipWithPlugin
      ];
      openFirewall = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jacko = {
    isNormalUser = true;
    description = "Jakob";
    extraGroups = [ 
      "networkmanager" 
      "wheel"
      "libvirtd"
      "scanner"
      "lp"
    ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  # Old home-manager import - as a module
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "jacko" = import ./home.nix;
    };
    backupFileExtension = "backup";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    ghostty
    fzf
    nemo
    wget
    tealdeer
    libnotify
    hyprshot #screenshot
    hyprpolkitagent
    papirus-icon-theme

    # virt-viewer
    # spice
    # spice-gtk
    # spice-protocol
    # win-virtio
    # win-spice
  ];

  # Programs
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };

    fish.enable = true;

    # localsend = {
    #   enable = true;
    #   openFirewall = true;
    # };

    virt-manager.enable = true;

    system-config-printer.enable = true;
    };

  # Serivces:
  services = { 
    xserver.displayManager.gdm.enable = true;
    # displayManager.cosmic-greeter.enable = true;

    # Pipewire is required for sound 
    pipewire = {
      enable = true;
      pulse.enable = true;       # PipeWire's PulseAudio replacement
      alsa.enable = true;
      alsa.support32Bit = true;  # if needed
    };

    # For usb mounting
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;

    # Nextcloud shite
    gnome.gnome-keyring.enable = true;

    spice-vdagentd.enable = true;

    # Printing
    printing = {
      enable = true;
      drivers = [
        pkgs.gutenprint
        pkgs.hplip
      ];
    };
    # system-config-printer.enable = true;
  };

  # Security:
  security = {
    rtkit.enable = true;
  };

  # Virtualisation
  virtualisation = {

    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };

    spiceUSBRedirection.enable = true;
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall = {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };

  # Garbage collector
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
