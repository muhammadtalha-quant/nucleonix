{
    enable = true;
    setupOpts.keymap = {
        preset = "none";

        "<Tab>" = [
            "select_next"
            "snippet_forward"
            "fallback"
        ];

        "<S-Tab>" = [
            "select_prev"
            "snippet_backward"
            "fallback"
        ];

        "<CR>" = [
            "accept"
            "fallback"
        ];

        "<C-Space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
        ];

        "<C-e>" = [
            "hide"
            "fallback"
        ];
    };
}
