{
  pkgs,
  ...
}:
let
  stylixTargets = {
    btop.enable = false;
    cava.enable = false;
    starship.enable = false;
    kitty.enable = false;
    hyprland.enable = false;
    noctalia.enable = false;
    neovim.enable = false;
  };
  macchiato = {
    spec = {
      overlays.enable = false;
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
      polarity = "dark";
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
          flavor = "macchiato";
          accent = "mauve";
        };
        dark = "Papirus-Dark";
      };
      cursor = {
        name = "catppuccin-macchiato-mauve-cursors";
        package = pkgs.catppuccin-cursors.macchiatoMauve;
        size = 26;
      };
      targets = stylixTargets;
    };
    lazyvim = ''
      return {
        {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "catppuccin-macchiato",
            transparent_background = true,
          },
        },
      }
    '';
    noctalia = ../dotfiles/noctalia/macchiato.toml;
    hyprland = {
      content = ../dotfiles/hypr/macchiato.lua;
      autoLoad = true;
    };
    starship = builtins.fromTOML (builtins.readFile ../dotfiles/starship/macchiato.toml);
    kitty = "Catppuccin-Macchiato";
  };
  latte = {
    spec = {
      overlays.enable = false;
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
      polarity = "light";
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
          flavor = "latte";
          accent = "mauve";
        };
        light = "Papirus-Light";
      };
      cursor = {
        name = "catppuccin-latte-mauve-cursors";
        package = pkgs.catppuccin-cursors.latteMauve;
        size = 26;
      };
      targets = stylixTargets;
    };
    lazyvim = ''
      return {
        {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "catppuccin-latte",
            transparent_background = true,
          },
        },
      }
    '';
    noctalia = ../dotfiles/noctalia/latte.toml;
    hyprland = {
      content = ../dotfiles/hypr/latte.lua;
      autoLoad = true;
    };
    starship = builtins.fromTOML (builtins.readFile ../dotfiles/starship/latte.toml);
    kitty = "Catppuccin-Latte";
  };
  theme = macchiato;
in
{
  stylix = theme.spec;
  wayland.windowManager.hyprland.extraLuaFiles = {
    "theme" = theme.hyprland;
  };
  programs = {
    kitty.themeFile = theme.kitty;
    lazyvim.plugins.colorscheme = theme.lazyvim;
    noctalia.settings = theme.noctalia;
    starship.settings = theme.starship;
  };
}
