{ pkgs, ... }: {
  programs.lazyvim = {
    enable = true;
    ignoreBuildNotifications = true;
    plugins.colorscheme = ''
      return {
        { "ellisonleao/gruvbox.nvim" },
        {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "gruvbox",
          },
        }
      }
    '';
    extras.lang.nix.enable = true;

    extraPackages = with pkgs; [
      #!=== NIX ===!
      nil
      statix
      nixfmt
    ];
  };
}
