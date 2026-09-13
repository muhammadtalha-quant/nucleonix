{
  programs.lazyvim = {
    enable = true;
    ignoreBuildNotifications = true;
    extras.lang = {
      nix.enable = true;
      markdown.enable = true;
    };
    config = {
      options = ''
        vim.g.trouble_lualine = false
        vim.o.exrc = true
        vim.o.secure = true
      '';
      autocmds = "";
      keymaps = "";
    };
  };
}
