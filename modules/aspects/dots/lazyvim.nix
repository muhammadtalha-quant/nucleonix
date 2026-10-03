{
  dots.lazyvim = { theme }: {
    homeManager = { inputs, ... }: {
      imports = [
        inputs.lazyvim.homeManagerModules.default
      ];
      programs.lazyvim = {
        enable = true;
        ignoreBuildNotifications = true;
        extras = {
          coding.neogen.enable = true;
          test.core.enable = true;
          util.gh.enable = true;
          dap = {
            core.enable = true;
            nlua.enable = true;
          };
          editor = {
            harpoon2.enable = true;
            refactoring.enable = true;
          };
          lang = {
            nix.enable = true;
            markdown.enable = true;
            clangd.enable = true;
            cmake.enable = true;
            python.enable = true;
            json.enable = true;
            toml.enable = true;
            sql.enable = true;
            typst.enable = true;
            yaml.enable = true;
          };
        };
        plugins.colorscheme =
          if theme == "dark" then
            ''
              return {
                 {
                   "LazyVim/LazyVim",
                  opts = {
                    colorscheme = "catppuccin-macchiato",
                  },
                 },
               }
            ''
          else if theme == "light" then
            ''
              return {
                {
                  "LazyVim/LazyVim",
                   opts = {
                     colorscheme = "catppuccin-latte",
                   },
                },
              }
            ''
          else
            "";
        configFiles = ./raw-dotfiles/lazyvim;
      };
    };
  };
}
