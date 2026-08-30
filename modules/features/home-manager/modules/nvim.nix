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
    plugins.custom_dashboard = ''
      return {
        "snacks.nvim",
        opts = {
          dashboard = {
            preset = {
              pick = function(cmd, opts)
                return LazyVim.pick(cmd, opts)()
              end,
              header = [[
                ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
                ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
                ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
                ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
                ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
                ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                >>=>              THE LAZY WAY                <=<<
              ]],
              keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
              },
            },
          },
        },
      }
    '';
  };
}
