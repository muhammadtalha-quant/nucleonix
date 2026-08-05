{
    enableTreesitter = true;
    enableFormat = true;
    enableDAP = true;

    nix = {
        enable = true;
        format.type = [ "nixfmt" ];
        lsp.servers = [ "nil" ];
    };
    typst = {
        enable = true;
        extensions.typst-concealer.enable = true;
        extensions.typst-concealer.mappings.toggleConcealing = "<leader>T";
        format.type = [ "typstyle" ];
        lsp.servers = [ "tinymist" ];
    };
    cmake = {
        enable = true;
        format.type = [ "gersemi" ];
        lsp.servers = [ "neocmakelsp" ];
    };
    clang = {
        enable = true;
        dap.debugger = [ "lldb" ];
        format.type = [ "clang-format" ];
        lsp.servers = [ "clangd" ];
    };
    toml = {
        enable = true;
        format.type = [ "tombi" ];
        lsp.servers = [ "tombi" ];
    };
    yaml = {
        enable = true;
        format.type = [ "prettier" ];
        lsp.servers = [ "yaml-language-server" ];
    };
    json = {
        enable = true;
        format.type = [ "jsonfmt" ];
        lsp.servers = [ "vscode-json-language-server" ];
    };
    markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
        format.type = [ "deno" ];
        lsp.servers = [ "marksman" ];

    };
    python = {
        enable = true;
        dap.debugger = [ "debugpy" ];
        format.type = [ "ruff" ];
        lsp.servers = [ "basedpyright" ];
    };
}
