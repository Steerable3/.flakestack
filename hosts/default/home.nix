{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jacko";
  home.homeDirectory = "/home/jacko";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    newsflash
    hardinfo2 #hardware information
    logseq
    obsidian
    tenacity #audio editor
    bitwarden
    gnome-calculator #calculator
    gnome-system-monitor #system monitor
    # fastfetch
    gcc
    eog #image viewer
    mpv #video player
    mullvad-browser
    libreoffice-fresh
    hunspell
    hunspellDicts.en-gb-large
    hyprsunset
    xarchiver
    protonmail-desktop
    vscodium
    jdk
    nitch
    simple-scan
    ocrmypdf
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-twilight.desktop";
      "x-scheme-handler/http" = "zen-twilight.desktop";
      "x-scheme-handler/https" = "zen-twilight.desktop";
      "x-scheme-handler/about" = "zen-twilight.desktop";
      "x-scheme-handler/unknown" = "zen-twilight.desktop";
      "x-scheme-handler/terminal" = "ghotty.desktop";
    };
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/cosmic" = {
      source = ../../linked/cosmic;
    };
  };

  #Imports all necessary home-manager modules
  imports = [
    ../../modules/home-manager/desktop-enviorment/hyprland.nix
    # ../../modules/home-manager/desktop-enviorment/hyprpanel.nix
    ../../modules/home-manager/desktop-enviorment/waybar.nix
    ../../modules/home-manager/desktop-enviorment/hyprlock.nix
    ../../modules/home-manager/desktop-enviorment/hypridle.nix
    ../../modules/home-manager/desktop-enviorment/stylix.nix
    ../../modules/home-manager/desktop-enviorment/rofi.nix
    # ../../modules/home-manager/desktop-enviorment/monitorctl.nix
    ../../modules/home-manager/terminal/fish.nix
    ../../modules/home-manager/terminal/ghostty.nix
    ../../modules/home-manager/terminal/starship.nix
    ../../modules/home-manager/apps/zen.nix
    ../../modules/home-manager/apps/spicetify.nix
    ../../modules/home-manager/apps/nvf.nix
    ../../modules/home-manager/apps/git.nix
  ];

  services = { 
    nextcloud-client = {
      enable = true;
      startInBackground = true;
    };

    kdeconnect = {
      enable = true;
      indicator = true;
    };

    hyprpolkitagent.enable = true;
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "/home/jacko/.bitwarden-ssh-agent.sock";

    # Sudoedit
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
  };

  news.display = "silent"; # Disables news notifications

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
