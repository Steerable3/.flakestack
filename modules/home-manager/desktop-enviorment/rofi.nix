{ config, pkgs, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "ghostty";

    modes = [
      "run"
      "drun"
      "window"
    ];

    plugins = [
      pkgs.rofi-emoji
      pkgs.rofi-calc
    ];

    extraConfig = {
      show-icons = true;
      drun-display-format = "{name}";
      display-drun = " ";
      display-run = " ";
      display-window = "  ";
      display-filebrowser = "  ";
      hover-select = false;
      scroll-method = 1;
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      window-format = "{w} · {c} · {t}";
    };

    theme = {
      "window" = {
        border = mkLiteral "3px";
        # border-radius = mkLiteral "2em";
        height = mkLiteral "35em";
        width = mkLiteral "56em";
        transparency = "real";
        fullscreen = false;
        enabled = true;
        cursor = "default";
        spacing = mkLiteral "0em";
        padding = mkLiteral "0em";
      };

      "mainbox" = {
        enabled = true;
        spacing = mkLiteral "0em";
        padding = mkLiteral "0em";
        orientation = mkLiteral "vertical";
        children = [
          "inputbar"
          "listbox"
        ];
        background-color = mkLiteral "transparent";
        background-image = mkLiteral ''url("~/.flakestack/hosts/Wallpapers/set/wallpaper", width)'';
      };

      inputbar = {
        enabled = true;
        spacing = mkLiteral "0em";
        padding = mkLiteral "5em";
        children = [
          "textbox-prompt-colon"
          "entry"
        ];
        background-color = mkLiteral "transparent";
        background-image = mkLiteral ''url("~/.flakestack/hosts/Wallpapers/set/wallpaper", width)'';
      };

      textbox-prompt-colon = {
        enabled = true;
        expand = false;
        str = "  ";
        padding = mkLiteral "1em 0.2em 0em 0em";
        # border-radius = mkLiteral "2em 0em 0em 2em";
      };

      entry = {
        enabled = true;
        # border-radius = mkLiteral "0em 2em 2em 0em";
        spacing = mkLiteral "1em";
        padding = mkLiteral "1em";
        cursor = mkLiteral "text";
        placeholder = "Search";
        placeholder-color = mkLiteral "inherit";
      };

      listbox = {
        padding = mkLiteral "0em";
        spacing = mkLiteral "0em";
        orientation = mkLiteral "horizontal";
        children = [
          "listview"
          "mode-switcher"
        ];
      };

      listview = {
        padding = mkLiteral "1.5em";
        spacing = mkLiteral "0.5em";
        enabled = true;
        columns = 2;
        lines = 3;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        cursor = "default";
        background-color = mkLiteral "transparent";
      };

      mode-switcher = {
        orientation = mkLiteral "vertical";
        width = mkLiteral "6.6em";
        enabled = true;
        padding = mkLiteral "1.5em";
        spacing = mkLiteral "1.5em";
        background-color = mkLiteral "transparent";
      };

      button = {
        cursor = mkLiteral "pointer";
        # border-radius = mkLiteral "2em";
      };
    };
  };
}
