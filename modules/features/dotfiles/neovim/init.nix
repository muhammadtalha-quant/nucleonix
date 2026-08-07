{
    pkgs,
    nvfLib,
    ...
}:
let
    options = import ./opts.nix;
    keymap = import ./keymap.nix;
    langs = import ./languages.nix;
    utils = import ./utils.nix;
    uiTheme = import ./theme.nix;
    ui2 = import ./ui2.nix;
    lspConfig = import ./lspconfig.nix;
    pluginDashboard = import ./plugins/dashboard.nix;
    pluginVisual = import ./plugins/visuals.nix;
    pluginToggleTerm = import ./plugins/toggleterm.nix;
    pluginMini = import ./plugins/mini.nix;
    pluginBlink = import ./plugins/blink.nix;
    pluginDiagnostics = import ./plugins/diagnostics.nix;
    pluginLualine = import ./plugins/lualine.nix;
    pluginWhichKey = import ./plugins/whichkey.nix;
    pluginTODO = import ./plugins/todo.nix;
    luaConfigRCLualine = import ./luaConfigRC/lualineRC.nix;
    luaConfigRCBlink = import ./luaConfigRC/blinkRC.nix;
in
{
    programs.nvf = {
        enable = true;
        enableManpages = true;
        settings = {
            vim = {
                luaConfigRC = {
                    lualine = luaConfigRCLualine;
                    blink-cmp = nvfLib.dag.entryAfter [ "autocomplete" ] luaConfigRCBlink;
                };
                extraPackages = [
                    pkgs.fzf
                    pkgs.ripgrep
                ];
                opts = options;
                keymaps = keymap;
                theme = uiTheme;
                utility = utils;
                terminal.toggleterm = pluginToggleTerm;
                dashboard.dashboard-nvim = pluginDashboard;
                diagnostics = pluginDiagnostics;
                binds.whichKey = pluginWhichKey;
                ui = ui2;
                lsp = lspConfig;
                debugger.nvim-dap = {
                    enable = true;
                    ui.enable = true;
                };
                languages = langs;
                visuals = pluginVisual;
                notes.todo-comments = pluginTODO;
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
