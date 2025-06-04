{ inputs, config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    plugins = [
      pkgs.rofi-emoji
      pkgs.rofi-calc
    ];

    extraConfig = {
      modi = "run,drun,window";
      # icon-theme = "Papirus";
      show-icons = true;
      terminal = "ghostty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      display-Network = " 󰤨  Network";
      sidebar-mode = true;
    };

    # extraConfig = {
    #   # Launcher modes, e.g. drun for desktop apps, run for commands
    #   modi = "drun,run";
    #
    #   # Font used in Rofi
    #   font = "FiraCode Nerd Font 12";
    #
    #   # Whether to show icons next to applications
    #   "show-icons" = true;
    #
    #   # Number of lines in the window
    #   lines = 5;
    #
    #   # Number of columns in the window
    #   columns = 1;
    #
    #   # Enable case-insensitive matching
    #   "case-sensitive" = false;
    #
    #   # Other Rofi config options can be added here
    # };
  };
}
