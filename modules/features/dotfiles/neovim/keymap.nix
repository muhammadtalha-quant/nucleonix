[
    {
        key = "<C-s>";
        mode = "n";
        action = "<cmd>w<CR>";
    }
    {
        key = "<leader>ss";
        mode = "n";
        action = ''
            function()
                require('grug-far').open({prefills = {paths = vim.fn.expand('%:p:h')}})
            end
        '';
        lua = true;
        desc = "Search: Open GrugFar in Current Directory";
    }
    {
        key = "<leader>sf";
        mode = "n";
        action = ''
            function()
                require('grug-far').open({ prefills = { paths = vim.fn.expand('%'), search = vim.fn.expand('<cword>') } }) 
            end'';
        lua = true;
        desc = "Search: Word under cursor in Current File";
    }
    {
        key = "<leader>sf";
        mode = "v";
        action = ''
            function()
                require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })
            end
        '';
        lua = true;
        desc = "Search: Selection in Current File";
    }

    {
        key = "<leader>sd";
        mode = "n";
        action = ''
            function()
                require('grug-far').open({ prefills = { paths = vim.fn.expand('%:p:h'), search = vim.fn.expand('<cword>') } })
             end
        '';
        lua = true;
        desc = "Search: Word under cursor in Current Directory";
    }
    {
        key = "<leader>sd";
        mode = "v";
        action = ''
            function()
                require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%:p:h') } })
            end
        '';
        lua = true;
        desc = "Search: Selection in Current Directory";
    }
    {
        key = "<C-n>";
        mode = "n";
        action = "<cmd>ene | startinsert<CR>";
    }
    {
        key = "<leader>q";
        mode = "n";
        action = "<cmd>q<CR>";
        desc = "Close Buffer/Neovim ";
    }

    {
        key = "<Esc>";
        mode = "n";
        action = "<cmd>noh<CR>";
        desc = "Clear search highlight";
    }
    {
        key = "<leader>|";
        mode = "n";
        action = "<C-w>v";
        desc = "Split vertically";
    }
    {
        key = "<leader>-";
        mode = "n";
        action = "<C-w>s";
        desc = "Split horizontally";
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
        key = "<M-x>";
        mode = "n";
        action = "<cmd>bd<CR>";
        desc = "Delete buffer";
    }
    {
        key = "<C-Right>";
        mode = "n";
        action = "<C-w>l";
        desc = "Move right window";
    }
    {
        key = "<C-Down>";
        mode = "n";
        action = "<C-w>j";
        desc = "Move down window";
    }
    {
        key = "<C-Up>";
        mode = "n";
        action = "<C-w>k";
        desc = "Move up window";
    }
    {
        key = "<C-Left>";
        mode = "n";
        action = "<C-w>h";
        desc = "Move left window";
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
        key = "<leader>di";
        mode = "n";
        action = "<cmd>DapStepInto<CR>";
        desc = "Step into";
    }
    {
        key = "<leader>do";
        mode = "n";
        action = "<cmd>DapStepOver<CR>";
        desc = "Step over";
    }
    {
        key = "<leader>dt";
        mode = "n";
        action = "<cmd>DapTerminate<CR>";
        desc = "Terminate session";
    }
    {
        key = "<leader>du";
        mode = "n";
        action = ''
            function()
                require('dapui').toggle()
            end
        '';
        lua = true;
        desc = "Toggle DAP UI";
    }
    {
        key = "<S-tab>";
        mode = "n";
        action = "<cmd>tabclose<CR>";
        desc = "Close Tab";
    }
    {
        key = "<leader>gd";
        mode = "n";
        action = "<cmd>Gitsigns diffthis<CR>";
        desc = "Diff buffer";
    }
    {
        key = "<leader>gb";
        mode = "n";
        action = "<cmd>Gitsigns blame<CR>";
        desc = "Blame buffer";
    }
]
