{
  mainBar = {
    layer = "top";
    position = "top";
    height = 30;

    modules-left = [ "wlr/workspaces" ];
    modules-right = [ "memory" "cpu" "pulseaudio" "clock#time" "clock#date" ];

    "clock#time" = {
      interval = 1;
      format = "{:%H:%M:%S}";
      tooltip = false;
    };

    "clock#date" = {
      interval = 10;
      format = "{:%Y-%m-%d}";
      tooltip = false;
    };

    "cpu" = {
      interval = 5;
      format = "cpu {usage}% ({load})";
      states = {
      warning = 70;
      critical = 90;
      };
    };

    "memory" = {
      interval = 5;
      format = "mem {}%";
      states = {
        warning = 70;
        critical = 90;
      };
    };

    "pulseaudio" = {
      format = "{volume}%";
      on-click = "pavucontrol";
      tooltip = false;
    };
  };
}