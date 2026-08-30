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
    nix = {
      enable = true;
      lsp.package = pkgs.nil;
    };
    lua.enable = true;
  };
  scripts = {
    compile.exec = "nh os boot";
    apply.exec = "nh os test";
    deploy.exec = "nh os switch";
  };
}
