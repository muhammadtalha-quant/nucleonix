{
  pkgs,
  pkgs-unstable,
  inputs,
  stateVersion,
  userName,
  stylix,
  lazyvim,
  ...
}:

{

  imports = [
    lazyvim.homeManagerModules.default
    stylix.homeModules.stylix
    (inputs.import-tree ./modules)
  ];
  programs.home-manager.enable = true;
  home = {
    username = userName;
    pointerCursor.enable = true;
    homeDirectory = "/home/${userName}";
    packages = with pkgs; [
      pipes
      clock-rs
      wl-clipboard
      satty
      cmatrix
      google-chrome
      obsidian
      nautilus
      papers
      showtime
      amberol
      file-roller
      loupe
      video-downloader
      pkgs-unstable.noctalia
    ];
    inherit stateVersion;
  };

}
