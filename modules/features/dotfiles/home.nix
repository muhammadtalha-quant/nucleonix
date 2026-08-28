{
  pkgs,
  pkgs-unstable,
  inputs,
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
      google-chrome
      wl-clipboard
      bat
      satty
      obsidian
      nautilus
      papers
      showtime
      amberol
      file-roller
      _7zz
      zip
      unzip
      rar
      unar
      loupe
      gh
      eza
      pkgs-unstable.devenv
      pkgs-unstable.noctalia
    ];
    stateVersion = "26.05";
  };

}
