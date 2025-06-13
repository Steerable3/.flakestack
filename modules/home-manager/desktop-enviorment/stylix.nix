{ pkgs, ... }:

{
  stylix = {
    enable = true;
    # Sets background
    image = ../../../hosts/Wallpapers/set/wallpaper;
    # Sets (dark)mode
    polarity = "either";
    # Sets theme
    base16Scheme = {
      base00 = "272e33";
      base01 = "2e383c";
      base02 = "414b50";
      base03 = "859289";
      base04 = "9da9a0";
      base05 = "d3c6aa";
      base06 = "edeada";
      base07 = "fffbef";
      base08 = "e67e80";
      base09 = "e69875";
      base0A = "dbbc7f";
      base0B = "a7c080";
      base0C = "83c092";
      base0D = "7fbbb3";
      base0E = "d699b6";
      base0F = "9da9a0";
    };
       
    targets = {
      hyprlock.enable = false;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      serif = {
        package = pkgs.crimson-pro;
        name = "Crimson Pro";
      };

      emoji = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      # Optional: font sizes to tweak readability
      sizes = {
        terminal = 11;
        applications = 10;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    iconTheme = {
      enable = true;
      package = pkgs.tela-icon-theme;
      light = "Tela-nord";
      dark = "Tela-nord";
    };
  };
}
