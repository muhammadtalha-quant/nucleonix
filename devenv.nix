{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = with pkgs; [
    nixfmt
    statix
    marksman
    markdownlint-cli2
    markdown-toc
  ];
  languages = {
    nix.enable = true;
    nix.lsp.package = pkgs.nil;
    lua.enable = true;
  };
}
