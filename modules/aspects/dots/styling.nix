{
  dots.styling = { theme }: {
    homeManager =
      {
        inputs,
        pkgs,
        lib,
        ...
      }:
      {
        imports = [
          inputs.stylix.homeModules.stylix
        ];
        stylix = {
          overlays.enable = false;
          enable = true;
          base16Scheme =
            if theme == "dark" then
              "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml"
            else if theme == "light" then
              "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml"
            else
              "";
          polarity = if theme == "dark" || theme == "light" then theme else "either";
          fonts = {
            serif = {
              package = pkgs.noto-fonts;
              name = "Noto Sans";
            };

            sansSerif = {
              package = pkgs.inter;
              name = "Inter Variable";
            };

            monospace = {
              package = pkgs.nerd-fonts.jetbrains-mono;
              name = "JetBrainsMono Nerd Font Mono";
            };

            emoji = {
              package = pkgs.noto-fonts-color-emoji;
              name = "Noto Color Emoji";
            };
          };
          icons = {
            enable = true;
            package = pkgs.catppuccin-papirus-folders.override {
              flavor =
                if theme == "dark" then
                  "macchiato"
                else if theme == "light" then
                  "latte"
                else
                  "";
              accent = "mauve";
            };

            dark = if theme == "dark" then "Papirus-Dark" else null;
            light = if theme == "light" then "Papirus-Light" else null;
          };
          cursor = {
            name =
              if theme == "dark" then
                "catppuccin-macchiato-mauve-cursors"
              else if theme == "light" then
                "catppuccin-latte-mauve-cursors"
              else
                "";
            package =
              if theme == "dark" then
                pkgs.catppuccin-cursors.macchiatoMauve
              else if theme == "light" then
                pkgs.catppuccin-cursors.latteMauve
              else
                null;
            size = 26;
          };
          targets = {
            btop.enable = false;
            cava.enable = false;
            starship.enable = false;
            kitty.enable = false;
            hyprland.enable = false;
            noctalia.enable = false;
            neovim.enable = false;
          };
        };
      };
  };
}
