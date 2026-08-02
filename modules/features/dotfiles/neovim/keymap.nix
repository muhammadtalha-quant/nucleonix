[
    {
        key = "<C-s>";
        mode = "n";
        action = "<cmd>w<CR>";
    }
    {
        key = "<C-n>";
        mode = "n";
        action = "<cmd>ene | startinsert<CR>";
    }
    {
        key = "o";
        mode = "n";
        action = "<Nop>";
        noremap = true;
        silent = true;
    }
    {
        key = "O";
        mode = "n";
        action = "<Nop>";
        noremap = true;
        silent = true;
    }

    {
        key = "<leader>q";
        mode = "n";
        action = "<cmd>wqa<CR>";
        desc = "Close Neovim (changes are saved !)";
    }

    {
        key = "<leader>Q";
        mode = "n";
        action = "<cmd>wqa!<CR>";
        desc = "Close Neovim";
    }
    {
        key = "<Esc>";
        mode = "n";
        action = "<cmd>noh<CR>";
        desc = "Clear search highlight";
    }

    {
        key = "<leader>ff";
        mode = "n";
        action = "<cmd>FzfLua files<CR>";
        desc = "Find files";
    }
    {
        key = "<leader>fg";
        mode = "n";
        action = "<cmd>FzfLua live_grep<CR>";
        desc = "Live grep";
    }
    {
        key = "<leader>fb";
        mode = "n";
        action = "<cmd>FzfLua buffers<CR>";
        desc = "Find buffers";
    }
    {
        key = "<leader>fr";
        mode = "n";
        action = "<cmd>FzfLua oldfiles<CR>";
        desc = "Recent files";
    }

    {
        key = "<leader>bd";
        mode = "n";
        action = "<cmd>bd<CR>";
        desc = "Delete buffer";
    }
    {
        key = "<leader>bD";
        mode = "n";
        action = "<cmd>bd!<CR>";
        desc = "Force delete buffer";
    }
    {
        key = "<leader>bn";
        mode = "n";
        action = "<cmd>bn<CR>";
        desc = "Next buffer";
    }
    {
        key = "<leader>bp";
        mode = "n";
        action = "<cmd>bp<CR>";
        desc = "Previous buffer";
    }
    {
        key = "<C-Right>";
        mode = "n";
        action = "<cmd>lua require('smart-splits').move_cursor_left()<CR>";
        desc = "Move left window";
    }
    {
        key = "<C-Down>";
        mode = "n";
        action = "<cmd>lua require('smart-splits').move_cursor_down()<CR>";
        desc = "Move down window";
    }
    {
        key = "<C-Up>";
        mode = "n";
        action = "<cmd>lua require('smart-splits').move_cursor_up()<CR>";
        desc = "Move up window";
    }
    {
        key = "<C-Left>";
        mode = "n";
        action = "<cmd>lua require('smart-splits').move_cursor_right()<CR>";
        desc = "Move right window";
    }

    {
        key = "<leader>ld";
        mode = "n";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        desc = "Go to definition";
    }
    {
        key = "<leader>lr";
        mode = "n";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        desc = "References";
    }
    {
        key = "<leader>li";
        mode = "n";
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
        desc = "Implementation";
    }
    {
        key = "<leader>lh";
        mode = "n";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        desc = "Hover documentation";
    }
    {
        key = "<leader>la";
        mode = "n";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        desc = "Code action";
    }
    {
        key = "<leader>lrn";
        mode = "n";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        desc = "Rename symbol";
    }
    {
        key = "<leader>lf";
        mode = "n";
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        desc = "Format";
    }

    {
        key = "<leader>xx";
        mode = "n";
        action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
        desc = "Diagnostics list";
    }
    {
        key = "[d";
        mode = "n";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        desc = "Previous diagnostic";
    }
    {
        key = "]d";
        mode = "n";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        desc = "Next diagnostic";
    }

    {
        key = "<leader>td";
        mode = "n";
        action = "<cmd>TodoFzfLua<CR>";
        desc = "Find TODOs";
    }

    {
        key = "<leader>db";
        mode = "n";
        action = "<cmd>DapToggleBreakpoint<CR>";
        desc = "Breakpoint";
    }
    {
        key = "<leader>dc";
        mode = "n";
        action = "<cmd>DapContinue<CR>";
        desc = "Continue";
    }
    {
        key = "<leader>ds";
        mode = "n";
        action = "<cmd>DapStepOver<CR>";
        desc = "Step over";
    }
]
