{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        fixed-center = true;

        spacing = 5;
        margin-top = 4;
        margin-right = 4;
        margin-left = 4;
        margin-bottom = 0;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "tray"
          "battery"
          "custom/monitor1"
          "custom/monitor2"
          "network"
          "pulseaudio"
          "clock"
          "custom/notification"
        ];

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
        };

        "group/brightness" = {
          orientation = "horizontal";
          modules = [
            "custom/monitor-icon"
            "custom/monitor1"
            "custom/monitor2"
          ];
          drawer = {
            transition-left-to-right = false;
            transition-duration = 500;
          };
        };

        "custom/monitor-icon" = {
          format = "<span size='xx-large'> 󱡶</span>";
          tooltip = false;
        };

        "custom/monitor1" = {
          format = "<span rise='3000'>{percentage}% </span><span size='xx-large'>{icon}</span>1";
          format-icons = ["󰃞" "󰃝" "󰃠"];
          return-type = "json";
          exec = "ddcutil --bus 4 getvcp 10 | grep -oP 'current.*?=\\s*\\K[0-9]+' | xargs -I{} echo '{\"percentage\":{}}'";
          on-scroll-up = "ddcutil --noverify --bus 4 setvcp 10 + 10";
          on-scroll-down = "ddcutil --noverify --bus 4 setvcp 10 - 10";
          on-click = "ddcutil --noverify --bus 4 setvcp 10 0";
          on-click-right = "ddcutil --noverify --bus 4 setvcp 10 100";
          interval = 1;
          tooltip = false;
        };

        "custom/monitor2" = {
          format = "<span rise='3000'>{percentage}% </span><span size='xx-large'>{icon}</span>2";
          format-icons = ["󰃞" "󰃝" "󰃠"];
          return-type = "json";
          exec = "ddcutil --bus 3 getvcp 10 | grep -oP 'current.*?=\\s*\\K[0-9]+' | xargs -I{} echo '{\"percentage\":{}}'";
          on-scroll-up = "ddcutil --noverify --bus 3 setvcp 10 + 10";
          on-scroll-down = "ddcutil --noverify --bus 3 setvcp 10 - 10";
          on-click = "ddcutil --noverify --bus 3 setvcp 10 0";
          on-click-right = "ddcutil --noverify --bus 3 setvcp 10 100";
          interval = 1;
          tooltip = false;
        };

        "custom/notification" = {
          tooltip = false;
          format = "<span size='xx-large'>{icon}</span> ";
          format-icons = {
            notification = "󱅫";
            none = "󰂚";
            dnd-notification = "󰵙";
            dnd-none = "󰂛";
            inhibited-notification = "󱅫";
            inhibited-none = "󰂚";
            dnd-inhibited-notification = "󰵙";
            dnd-inhibited-none = "󰂛";
          };
          return-type = "json";
          exec = "swaync-client -swb";
          exec-if = "which swaync-client";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        tray = {
          spacing = 10;
          show-passive-items = true;
          tooltip = false;
        };

        network = {
          format-ethernet = "<span rise='3000'>{ipaddr}/{cidr} </span><span size='xx-large'>󰈀</span>";
          format-wifi = "<span rise='3000'>{essid} </span><span size='xx-large'></span>";
          format-disconnected = "<span rise='3000'>Disconnected </span><span size='xx-large'>󱘖</span>";
          tooltip-format = "↑ {bandwidthUpBits} ↓ {bandwidthDownBits}";
        };

        clock = {
          format = "{:%H:%M}";
          tooltip = true;
        };
        
        pulseaudio = {
          format = "<span rise='3000'>{volume}% </span><span size='xx-large'>{icon}</span>";
          format-muted = "<span size='xx-large'></span>";
          format-bluetooth = "<span rise='3000'>{volume}% </span><span size='xx-large'>󰂱{icon}</span>";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
          scroll-step = 5;
        };

        "hyprland/window" = {
          format = "{title}";
          separate-outputs = true;
          icon = true;
          rewrite = {
            
          };
        };

        "hyprland/workspaces" = {
          format = "<span size='xx-large'>{icon}</span>";
          persistent-workspaces = {
            "*" = 12;
            DP-1 = [ 1 2 3 4 5 ];
            HDMI-A-1 = [ 11 ];
          };
          format-icons = {
            default = "󰨔";
            active = "󰨕";
            empty = "󰝣";
            urgent = "󱋮";
          };
        };
      }
    ];
  };
}
