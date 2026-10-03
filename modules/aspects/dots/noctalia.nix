{
  dots.noctalia = { theme }: {
    nixos.programs = {
      noctalia = {
        enable = true;
        recommendedServices.enable = true;
        systemd = {
          enable = true;
          target = "hyprland-session.target";
        };
      };
    };
    homeManager = {
      noctalia = {
        enable = true;
        systemd.enable = true;
        settings =
          if theme == "dark" then
            ./raw-dotfiles/noctalia/macchiato.toml
          else if theme == "light" then
            ./raw-dotfiles/noctalia/latte.toml
          else
            { };
      };
    };
  };
}
