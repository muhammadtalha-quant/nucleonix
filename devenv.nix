{
  pkgs,
  #lib,
  #config,
  #inputs,
  ...
}:

{
  packages = with pkgs; [
    statix
    nixfmt
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
