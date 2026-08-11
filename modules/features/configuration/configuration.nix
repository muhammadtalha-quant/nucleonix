{
  inputs,
  pkgs,
  hostName,
  timeZone,
  configDirectory,
  locale,
  ...
}:
{
  imports = [
    ../../hosts/${hostName}/default.nix
    (inputs.import-tree ./modules)
  ];

  fonts.packages = with pkgs; [
    newcomputermodern
    xwayland-satellite
  ];
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
      nix-output-monitor
      gpu-screen-recorder
    ];
  };
  time.timeZone = timeZone;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
}
