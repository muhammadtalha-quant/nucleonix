{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    extraLuaFiles = {
      "hyprland.events" = {
        content = ../dotfiles/hypr/events.lua;
        autoLoad = true;
      };
      "hyprland.config" = {
        content = ../dotfiles/hypr/config.lua;
        autoLoad = true;
      };
      "hyprland.rules" = {
        content = ../dotfiles/hypr/rules.lua;
        autoLoad = true;
      };
      "hyprland.curves" = {
        content = ../dotfiles/hypr/curves.lua;
        autoLoad = true;
      };
      "hyprland.animations" = {
        content = ../dotfiles/hypr/animations.lua;
        autoLoad = true;
      };
      "hyprland.monitors" = {
        content = ../dotfiles/hypr/monitors.lua;
        autoLoad = true;
      };
      "hyprland.gestures" = {
        content = ../dotfiles/hypr/gestures.lua;
        autoLoad = true;
      };
      "lib.keys" = {
        content = ../dotfiles/hypr/keys.lua;
        autoLoad = false;
      };
      "lib.helpers" = {
        content = ../dotfiles/hypr/helpers.lua;
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
        content = ../dotfiles/hypr/applications.lua;
        autoLoad = false;
      };
      "hyprland.hotkeys.noctalia" = {
        content = ../dotfiles/hypr/noctalia.lua;
        autoLoad = false;
      };
      "hyprland.hotkeys.windows" = {
        content = ../dotfiles/hypr/windows.lua;
        autoLoad = false;
      };
      "hyprland.hotkeys.workspaces" = {
        content = ../dotfiles/hypr/workspaces.lua;
        autoLoad = false;
      };
      "hyprland.hotkeys.submaps" = {
        content = ../dotfiles/hypr/submaps.lua;
        autoLoad = false;
      };
    };
  };
}
