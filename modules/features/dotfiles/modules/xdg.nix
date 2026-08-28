{ pkgs, ... }: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
      config = {
        common = {
          default = [
            "gtk"
          ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
        };
      };
    };
    userDirs.enable = true;
    localBinInPath = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = with pkgs; [
        nautilus
        file-roller
        papers
        amberol
        showtime
        loupe
      ];
    };
  };
}
