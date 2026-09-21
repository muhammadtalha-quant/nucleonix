{
  programs.lazyvim = {
    enable = true;
    ignoreBuildNotifications = true;
    extras.lang = {
      nix.enable = true;
      markdown.enable = true;
    };
    configFiles = ../dotfiles/lazyvim;
  };
}
