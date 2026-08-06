{
    enable = true;

    friendly-snippets.enable = true;

    sourcePlugins = {
        spell.enable = true;
    };

    setupOpts = {

        keymap = {
            preset = "super-tab";
        };

        sources = {
            default = [
                "lsp"
                "path"
                "snippets"
                "buffer"
                "spell"
            ];
        };

        fuzzy = {
            implementation = "prefer_rust";
        };

        completion = {
            documentation = {
                auto_show = true;
                auto_show_delay_ms = 150;
            };
            menu = {
                auto_show = true;
            };
        };
    };
}
