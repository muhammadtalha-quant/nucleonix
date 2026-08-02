''
    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        require("lualine").refresh()
      end,
    })

    vim.api.nvim_create_autocmd("RecordingLeave", {
      callback = function()
        require("lualine").refresh()
      end,
    })
''
