{ config, ... }:

let
  stylix = config.lib.stylix.colors; 
in{
  programs.hyprlock = {
    enable = true;
    settings = {
      # General settings (no_fade_in, grace delay, hide_cursor, etc.)
      general = {
        no_fade_in    = true;
        grace         = 5;      # seconds before automatic lock (short for demo)
        hide_cursor   = true;
      };

      # Single background image (use your wallpaper path); apply blur to obscured lockscreen
      background = [
        {
          path        = "/home/jacko/.flakestack/hosts/Wallpapers/set/wallpaper";
          blur_passes = 2;
          blur_size   = 5;
        }
      ];

      # A clock label showing current time ($TIME variable is updated automatically)
      label = [
        {
          monitor     = "";               # empty = all monitors
          text        = "$TIME";         # 24h clock (e.g. 13:45)
          font_size   = 64;
          font_color  = "${stylix.withHashtag.base05}";
          font_family = "sans";
          position    = "0, -50";        # centered horizontally, 50px above center vertically
        }
      ];

      # Password input field (centered dots, custom colors, no placeholder text)
      input-field = [
        {
          size            = "300, 40";
          position        = "0,  50";    # centered horizontally, 50px below center vertically
          monitor         = "";
          dots_center     = true;
          fade_on_empty   = false;
          font_color      = "${stylix.withHashtag.base07}";
          inner_color     = "${stylix.withHashtag.base01}";
          outer_color     = "${stylix.withHashtag.base03}";
          outline_thickness = 2;
          placeholder_text = "";
          shadow_passes   = 0;
        }
      ];
    };
  };
}
