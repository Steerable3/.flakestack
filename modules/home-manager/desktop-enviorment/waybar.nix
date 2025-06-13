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

        spacing = 0;
        margin-top = 4;
        margin-right = 4;
        margin-left = 4;
        margin-bottom = 0;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "pulseaudio"
          "cpu_text"
          "cpu"
          "memory"
          "battery"
          "custom/notification"
        ];

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
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
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M - %a, %b %d %Y}";
          tooltip = true;
        };

        cpu = {
          format = "󰻠 : {usage}%";
          interval = 2;

          states = {
            critical = 90;
          };
        };

        memory = {
          format = " : {percentage}%";
          interval = 2;

          states = {
            critical = 80;
          };

          tooltip = true;
        };

        battery = {
          format = "battery {capacity}%";
          interval = 5;

          states = {
            warning = 20;
            critical = 10;
          };

          tooltip = false;
        };

        pulseaudio = {
          format = "{icon} : {volume}%";
          format-muted = "󰖁 : {volume}%";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
        };

        "hyprland/workspaces" = {
          format = "<span size='x-large'>{icon}</span>";
          persistent-workspaces = {
            "*" = 12;
            DP-1 = [ 1 2 3 4 5 ];
            HDMI-A-1 = [ 10 ];
          };
          format-icons = {
            default = "󱓼";
            active = "󱓻";
            empty = "";
            urgent = "󱨈";
          };
        };
      }
    ];

    style = ./style.css;
  };
}
