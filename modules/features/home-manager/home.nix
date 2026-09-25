{
  pkgs,
  inputs,
  stateVersion,
  userName,
  ...
}:

{

  imports = [
    inputs.stylix.homeModules.stylix
    inputs.lazyvim.homeManagerModules.default
    (inputs.import-tree ./modules)
  ];
  programs.home-manager.enable = true;
  home = {
    username = userName;
    pointerCursor.enable = true;
    homeDirectory = "/home/${userName}";
    packages = with pkgs; [
      pipes
      wl-clipboard
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
    ];
    inherit stateVersion;
  };

}
