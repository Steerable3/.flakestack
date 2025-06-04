{ ... }:

{
  services = {

    darkman = {
      enable = true;
      settings = {
        lat = 46.2;
        lang = 14.3;
        usegeoclue = false;
      };
    };

    wluma = {
      enable = true;
      settings = { 
        als.time = {
          thresholds = {
            "0" = "night";
            "7" = "dark";
            "9" = "dim";
            "11" = "normal";
            "13" = "bright";
            "16" = "normal";
            "18" = "dark";
            "20" = "night";
          };
        };
      };
    };

    # gammastep = {
    #   enable = true;
    #   tray = true;
    #   latitude = 46.2;
    #   longitude = 14.3;
    # };
  };
}
