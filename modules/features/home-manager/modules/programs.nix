{
  programs = {
    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    fastfetch.enable = true;
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
    lazygit.enable = true;
  };
}
