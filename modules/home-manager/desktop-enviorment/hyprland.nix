{ lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    # Hyprland configuration
    settings = {

	    ## Technical settings

      # Setting variables
      "$mainMod" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "nemo";
      "$menu" = "pkill rofi || rofi -show drun";
      "$browser" = "zen";

      # Sets up all the monitors
      monitor = [
        "DP-1, 1920x1080@144, 0x0, auto, vrr, 3"
        "HDMI-A-1, preferred, 1920x0, auto, vrr, 3"
      ];

      # Enviorment shit
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # Startup applications/scripts
      exec-once = [
        "bitwarden"
      ];

      # Input
      input = {
        kb_layout = "us";
        # kb_variant = "intl";
        kb_options = "compose:ralt";
	      follow_mouse = 1;
        special_fallthrough = true;
      };

      cursor = {
        inactive_timeout = 0;
        no_hardware_cursors = 1;
      };
	
	    ## Customization

      general = {
        gaps_in = 2;
      	gaps_out = 4;
	      border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
        "col.inactive_border" = lib.mkForce "0x00000000";
      };

      master = {
        new_status = "master";
      };

      decoration = {
        # rounding = 3;
        # rounding_power = 3;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        # border_part_of_window = false;
      };

      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

	    ## Keybinds

      # Sets all the keybinds
      bind = [
        # Applications general
        "$mainMod, Q, killactive," # Close active program
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"

        # Application launching
        "$mainMod, RETURN, exec, $terminal" # Open terminal
        "$mainMod, E, exec, $fileManager" # Open file manager
	      "$mainMod, B, exec, $browser" # Open browser
        "ALT, SPACE, exec, $menu" # Launch app launcher

        # Screenshots
        ", Print, exec, hyprshot -m region"
        "SHIFT, Print, exec, hyprshot -m window"
        "ALT_SHIFT, Print, exec, hyprshot -m output"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, grave, workspace, 11"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT, grave, movetoworkspace, 11"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # ž and Ž (Alt+z, Alt+Shift+z)
        # "ALT, Z, exec, wtype \"ž\""
        # "ALT, SHIFT, Z, exec, wtype \"Ž\""
        #
        # # š and Š (Alt+s, Alt+Shift+s)
        # "ALT, S, exec, wtype \"š\""
        # "ALT, SHIFT, S, exec, wtype \"Š\""
        #
        # # č and Č (Alt+c, Alt+Shift+c)
        # "ALT, C, exec, wtype \"č\""
        # "ALT, SHIFT, C, exec, wtype \"Č\""
        #
        # # ć and Ć (Alt+apostrophe, Alt+Shift+apostrophe)
        # "ALT, ', exec, wtype \"ć\""
        # "ALT, SHIFT, ', exec, wtype \"Ć\""
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      ## Window Rules
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      ## Workspace Rules
      workspace = [
        "1, deafult:DP-1, monitor:DP-1"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:DP-1"
        "7, monitor:DP-1"
        "8, monitor:DP-1"
        "9, monitor:DP-1"
        "10, monitor:DP-1"
        "11, deafult:HDMI-A-1, monitor:HDMI-A-1"
      ];
    };

    # Plugins
    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprsplit
      # pkgs.hyprsome
    ];
  };
} 
