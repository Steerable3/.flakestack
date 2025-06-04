{ inputs, config, pkgs, ... }:

{
  programs.anyrun = {
    enable = true;
    config = {
      closeOnClick = true;
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.3; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      showResultsImmediately = false;
      maxEntries = null;

      plugins = [
        "anyrun"
      ];
    };
  };
}
