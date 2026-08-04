{
    borders.enable = true;
    illuminate.enable = true;
    breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
    };
    ui2 = {
        enable = true;
        setupOpts = {
            msg = {
                targets = "msg";
                msg.timeout = 4500;
            };
        };
    };
    colorizer = {
        enable = true;
        setupOpts = {
            filetypes = {
                typst.names = true;
                "!markdown" = { };
                "!cpp" = { };
                "!sql" = { };
                "!cmake" = { };
                "!python" = { };
            };
            user_default_options = {
                names = false;
                rgb_fn = true;
                hsl_fn = true;
                mode = "background";
                RRGGBBAA = true;
                RRGGBB = true;
            };
        };
    };
}
