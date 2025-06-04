{ inputs, pkgs, ... }:

{
  stylix = {
    enable = true;
    # Sets background
    image = ../../../hosts/Wallpapers/set/wallpaper;
    # Sets (dark)mode
    polarity = "either";
    # Sets theme
    base16Scheme = {
      base00 = "1e1e1c";
      base01 = "2f2f2d";
      base02 = "474540";
      base03 = "605c55";
      base04 = "9a8f84";
      base05 = "c2b8ac";
      base06 = "e0d6cc";
      base07 = "f7f0e9";
      base08 = "b35c50";
      base09 = "cc7832";
      base0A = "d8b441";
      base0B = "8c9440";
      base0C = "5d9e77";
      base0D = "c8ad5c";
      base0E = "b79c6a";
      base0F = "b7a894";
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
