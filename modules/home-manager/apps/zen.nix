{ inputs, config, lib, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxStudies = true;
      DisableFeedbackCommands = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      DontCheckDefaultBrowser = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
    };

    # settings = {
    #   "privacy.resistFingerprinting" = true;
    # };
  };

  home.file = {
    # ".zen/profile.Custom/storage" = {
    #   source = ../../../linked/.zen/profile.Custom/storage;
    #   force = true;
    #   recursive = false;
    # };
    # ".zen/profile.Custom/extensions" = {
    #   source = ../../../linked/.zen/profile.Custom/extensions;
    #   force = true;
    #   recursive = false;
    # };
    # ".zen/profile.Custom/chrome" = {
    #   source = ../../../linked/.zen/profile.Custom/chrome;
    #   force = true;
    #   recursive = false;
    # };
    ".zen/profile.Custom" = {
      source = ../../../linked/.zen/profile.Custom;
      recursive = true;
      force = true;
    };
    ".zen/profiles.ini" = {
      source = ../../../linked/.zen/profiles.ini;
      force = true;
    };
  };

  # home.activation.fixZenPermissions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   chmod -R 700 ${config.home.homeDirectory}/.zen/profile.Custom
  #   chown -R jacko:jacko ${config.home.homeDirectory}/.zen/profile.Custom
  #   chmod 600 ${config.home.homeDirectory}/.zen/profiles.ini
  #   chown jacko:jacko ${config.home.homeDirectory}/.zen/profiles.ini
  # '';
}
