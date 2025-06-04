{ ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock"; # Command to lock the screen
        after_sleep_cmd = "hyprctl dispatch dpms on"; # Command after waking up
        ignore_dbus_inhibit = false; # Whether to ignore DBus inhibit signals
      };

      listener = [
        {
          timeout = 1800; # Time in seconds before triggering
          on-timeout = "hyprlock"; # Command to execute on timeout
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off"; # Turn off display
          on-resume = "hyprctl dispatch dpms on"; # Turn on display upon resume
        }
      ];
    };
  };
}
