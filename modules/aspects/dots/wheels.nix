{
  dots.wheels = {
    homeManager = {
      programs = {
        devenv = {
          enable = true;
          enableFishIntegration = true;
        };
        cava = {
          enable = true;
          settings.color.theme = "noctalia";
        };
        btop = {
          enable = true;
          settings = {
            update_ms = 100;
            color_theme = "noctalia";
          };
        };
      };
    };
  };
}
