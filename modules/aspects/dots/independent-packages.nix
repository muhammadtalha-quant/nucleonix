{
  dots.independent-packages = {
    homeManager = {pkgs, ...}: {
      home.pointerCursor.enable = true;
      home.packages = with pkgs;[
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
  };
  };
}
