let
    options = import ./opts.nix;
    keymap = import ./keymap.nix;
    langs = import ./languages.nix;
    utils = import ./utils.nix;
    uiTheme = import ./theme.nix;
    ui2 = import ./ui2.nix;
    pluginDashboard = import ./plugins/dashboard.nix;
    pluginVisual = import ./plugins/visuals.nix;
    pluginToggleTerm = import ./plugins/toggleterm.nix;
    pluginMini = import ./plugins/mini.nix;
    pluginBlink = import ./plugins/blink.nix;
    pluginDiagnostics = import ./plugins/diagnostics.nix;
    pluginLualine = import ./plugins/lualine.nix;
    luaConfigRCLualine = import ./luaConfigRC/lualine.nix;
in
{
    programs.nvf = {
        enable = true;
        enableManpages = true;
        settings = {
            vim = {
                luaConfigRC = {
                    lualine = luaConfigRCLualine;
                };
                opts = options;
                keymaps = keymap;
                theme = uiTheme;
                utility = utils;
                terminal.toggleterm = pluginToggleTerm;
                dashboard.dashboard-nvim = pluginDashboard;
                diagnostics = pluginDiagnostics;
                git.enable = true;
                binds.whichKey.enable = true;
                ui = ui2;
                lsp = {
                    enable = true;
                    formatOnSave = true;
                };
                debugger.nvim-dap.enable = true;
                languages = langs;
                visuals = pluginVisual;
                notes.todo-comments.enable = true;
                clipboard = {
                    enable = true;
                    providers.wl-copy.enable = true;
                    registers = "unnamedplus";
                };
                mini = pluginMini;
                statusline.lualine = pluginLualine;
                fzf-lua.enable = true;
                autocomplete.blink-cmp = pluginBlink;
            };
        };
    };
}
