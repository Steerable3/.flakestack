{ inputs, config, ... }: 
let
  colors = config.lib.stylix.colors;
  menuScaling = 70;
in {
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  programs.hyprpanel = {
    enable = true;
    overwrite.enable = true;
    hyprland.enable = true;
    overlay.enable = true;
  
    settings = {
      layout = {
        "bar.layouts" = {
          # Layout for the main monitor
          "1" = {
            left = [
              "dashboard"
              "windowtitle"
              "cava"
            ];
            middle = [
              "notifications"
              "workspaces"
              "power"
            ];
            right = [
              "systray"
              "hyprsunset"
              "volume"
              "network"
              "clock"
            ];
          };
          # Layout for side monitors
          "*" = {
            left = [
              "dashboard"
              "windowtitle"
              "cava"
            ];
            middle = [
              "workspaces"
            ];
            right = [
              "systray"
              "volume"
              "network"
              "clock"
            ];
          };
        };
      };

      bar = {
        battery.label = false;
        launcher.autoDetectIcon = true;
        media.show_active_only = true;

        clock = {
          format = "%A, %b %e. %H:%M:%S";
        };

        workspaces = {
          showApplicationIcons = true;
          showWsIcons = true;
        };

        customModules = {
          cava = {
            showIcon = false;
            leftClick = "menu:media";
            showActiveOnly = true;
          };
        };
      };

      theme = { 
        name = "monochrome_vivid";
        # matugen = true;
        font.name = "JetBrainsMono Nerd Font";

        bar = {
          scaling = 85;
          floating = false;
          opacity = 70;

          buttons = {
            background_opacity = 0;
            background_hover_opacity = 100;
            monochrome = true;

            dashboard.enableBorder = true;
            workspaces.enableBorder = true;
            clock.enableBorder = true;
          };

          menus.menu = {
            battery.scaling = menuScaling;
            bluetooth.scaling = menuScaling;
            clock.scaling = menuScaling;
            dashboard.scaling = menuScaling;
            network.scaling = menuScaling;
            media.scaling = menuScaling;
            notifications.scaling = menuScaling;
            power.scaling = menuScaling;
            volume.scaling = menuScaling;
          };
        };
      };

      menus = {
        clock = {
          time.military = true;
          weather = {
            unit = "metric";
            location = "Kranj";
            key = "4b485da10b014b1c961184011251005";
          };
        };

        dashboard = {
          powermenu.avatar.image = "/home/jacko/.flakestack/hosts/Wallpapers/set/avatar";
        };
      };

      # wallpaper = {
      #   image = "/home/jacko/.flakestack/hosts/Wallpapers/set/wallpaper";
      # };
    };
    override = {
      # theme.bar.menus.text = "#FF0000";      # Red text color
      # theme.bar.menus.border = "#00FF00";    # Green border color (if supported)
    };
  };
}
