{
    enable = true;
    setupOpts = {
        theme = "doom";
        config = {
            header = [
                ""
                ""
                "██████╗ ███████╗ ██████╗██╗    ██╗   ██╗██╗███╗   ███╗"
                "██╔══██╗██╔════╝██╔════╝██║    ██║   ██║██║████╗ ████║"
                "██║  ██║█████╗  ██║     ██║    ██║   ██║██║██╔████╔██║"
                "██║  ██║██╔══╝  ██║     ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║"
                "██████╔╝███████╗╚██████╗███████╗╚████╔╝ ██║██║ ╚═╝ ██║"
                "╚═════╝ ╚══════╝ ╚═════╝╚══════╝ ╚═══╝  ╚═╝╚═╝     ╚═╝"
                "                                made possible with NVF"
                ""
                ""
            ];
            center = [
                {
                    icon = " ";
                    desc = "New file";
                    action = "ene | startinsert";
                    key = "n";
                }
                {
                    icon = " ";
                    desc = "Find files";
                    action = "FzfLua files";
                    key = "f";
                }
                {
                    icon = " ";
                    desc = "Find text (Grep)";
                    action = "FzfLua live_grep";
                    key = "g";
                }
                {
                    icon = " ";
                    desc = "Recent files";
                    action = "FzfLua oldfiles";
                    key = "F";
                }
                {
                    icon = "󰩈 ";
                    desc = "Quit Neovim";
                    action = "q";
                    key = "q";
                }
            ];
            footer = [
                "╔╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╤╗"
                "╟┼┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┼╢"
                "╟┤THE IDE FOR PEOPLE LIVING IN THE TERMINAL├╢"
                "╟┼┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┼╢"
                "╚╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╧╝"
            ];
        };
    };
}
