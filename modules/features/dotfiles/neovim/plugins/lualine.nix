{
    enable = true;
    disabledFiletypes.winbar = [
        "nix"
        "markdown"
        "dashboard"
        "sql"
    ];
    extraActiveSection.c = [
        ''
            {
              function()
                local reg = vim.fn.reg_recording()
                if reg ~= "" then
                  return " RECORDING @" .. reg
                end
                return ""
              end,
            }
        ''
    ];
}
