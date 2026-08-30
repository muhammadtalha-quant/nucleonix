{
  pkgs,
  locale,
  configDirectory,
  ...
}:
{
  environment = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      QT_QPA_PLATFORM = "wayland;xcb";
      NIXOS_OZONE_WL = "1";
      FLAKE_PATH = configDirectory;
      LANG = locale;
    };
    systemPackages = with pkgs; [
      gpu-screen-recorder
    ];
  };

}
