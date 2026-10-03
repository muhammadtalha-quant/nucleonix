{
  dots.wm = { theme }: {
    nixos = {
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        withUWSM = false;
      };
    };
    homeManager = {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        extraLuaFiles = {
          "theme" = {
            content =
              if theme == "dark" then
                ./raw-dotfiles/hypr/macchiato.lua
              else if theme == "light" then
                ./raw-dotfiles/hypr/latte.lua
              else
                "";
            autoLoad = true;
          };
          "hyprland.events" = {
            content = ./raw-dotfiles/hypr/events.lua;
            autoLoad = true;
          };
          "hyprland.config" = {
            content = ./raw-dotfiles/hypr/config.lua;
            autoLoad = true;
          };
          "hyprland.rules" = {
            content = ./raw-dotfiles/hypr/rules.lua;
            autoLoad = true;
          };
          "hyprland.curves" = {
            content = ./raw-dotfiles/hypr/curves.lua;
            autoLoad = true;
          };
          "hyprland.animations" = {
            content = ./raw-dotfiles/hypr/animations.lua;
            autoLoad = true;
          };
          "hyprland.monitors" = {
            content = ./raw-dotfiles/hypr/monitors.lua;
            autoLoad = true;
          };
          "hyprland.gestures" = {
            content = ./raw-dotfiles/hypr/gestures.lua;
            autoLoad = true;
          };
          "lib.keys" = {
            content = ./raw-dotfiles/hypr/keys.lua;
            autoLoad = false;
          };
          "lib.helpers" = {
            content = ./raw-dotfiles/hypr/helpers.lua;
            autoLoad = false;
          };
          "hyprland.keys" = {
            content = ''
              require("hyprland.hotkeys.applications")
              require("hyprland.hotkeys.noctalia")
              require("hyprland.hotkeys.windows")
              require("hyprland.hotkeys.workspaces")
              require("hyprland.hotkeys.submaps")
            '';
            autoLoad = true;
          };
          "hyprland.hotkeys.applications" = {
            content = ./raw-dotfiles/hypr/applications.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.noctalia" = {
            content = ./raw-dotfiles/hypr/noctalia.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.windows" = {
            content = ./raw-dotfiles/hypr/windows.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.workspaces" = {
            content = ./raw-dotfiles/hypr/workspaces.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.submaps" = {
            content = ./raw-dotfiles/hypr/submaps.lua;
            autoLoad = false;
          };
        };
      };
    };
  };
}
