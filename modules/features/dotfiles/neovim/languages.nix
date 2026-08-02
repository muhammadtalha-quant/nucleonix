{
    enableExtraDiagnostics = true;
    enableTreesitter = true;
    enableFormat = true;
    enableDAP = true;

    nix = {
        enable = true;
        format.type = [ "nixfmt" ];
        extraDiagnostics.types = [
            "statix"
            "deadnix"
        ];
        lsp.servers = [ "nil" ];
    };
    typst = {
        enable = true;
        extensions.typst-concealer.enable = true;
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
        extraDiagnostics.types = [ "clangtidy" ];
        format.type = [ "clang-format" ];
        lsp.servers = [ "clangd" ];
    };
    toml = {
        enable = true;
        extraDiagnostics.types = [ "tombi" ];
        format.type = [ "tombi" ];
        lsp.servers = [ "tombi" ];
    };
    yaml = {
        enable = true;
        format.type = [ "prettier" ];
        lsp.servers = [ "yaml-language-server" ];
    };
    sql = {
        enable = true;
        extensions.sqls-nvim.enable = true;
        extraDiagnostics.types = [ "sqlfluff" ];
        format.type = [ "sqlfluff" ];
        lsp.servers = [ "sqls" ];

    };
    json = {
        enable = true;
        format.type = [ "jsonfmt" ];
        lsp.servers = [ "vscode-json-language-server" ];
    };
    markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
        extraDiagnostics.types = [ "markdownlint-cli2" ];
        format.type = [ "deno" ];
        lsp.servers = [ "marksman" ];

    };
    python = {
        enable = true;
        dap.debugger = [ "debugpy" ];
        extraDiagnostics.types = [ "mypy" ];
        format.type = [ "ruff" ];
        lsp.servers = [ "basedpyright" ];
    };
}
