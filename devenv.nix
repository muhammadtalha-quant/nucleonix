{
  pkgs,
  ...
}:

{
  packages = with pkgs; [
    statix
    nixfmt
  ];

  languages.nix = {
    enable = true;
    lsp.package = pkgs.nil;
  };
}
