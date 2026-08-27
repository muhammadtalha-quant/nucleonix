{
  pkgs,
  lib,
  ...
}:
let
  disabledTargetsStylix = {
    btop.enable = false;
    cava.enable = false;
    starship.enable = false;
    kitty.enable = false;
    hyprland.enable = false;
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
      targets = disabledTargetsStylix;
    };
    symlinks = {
      "fastfetch/config.jsonc".source = lib.mkForce ../raw/fastfetch/universal.jsonc;
      "starship.toml".source = lib.mkForce ../raw/starship/macchiato.toml;
      "noctalia/config.toml".source = lib.mkForce ../raw/noctalia/macchiato.toml;
    };
    lazyvim = ''
      return {
        {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "catppuccin-macchiato",
          },
        },
      }
    '';
    kitty = "catppuccin-Macchiato";
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
      targets = disabledTargetsStylix;
    };
    symlinks = {
      "fastfetch/config.jsonc".source = lib.mkForce ../raw/fastfetch/universal.jsonc;
      "starship.toml".source = lib.mkForce ../raw/starship/latte.toml;
      "noctalia/config.toml".source = lib.mkForce ../raw/noctalia/latte.toml;
    };
    lazyvim = ''
      return {
        {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "catppuccin-latte",
          },
        },
      }
    '';
    kitty = "Catppuccin-Latte";
  };
  theme = latte;
in
{
  stylix = theme.spec;
  xdg.configFile = theme.symlinks;
  programs.lazyvim.plugins.colorscheme = theme.lazyvim;
  programs.kitty.themeFile = theme.kitty;
}
