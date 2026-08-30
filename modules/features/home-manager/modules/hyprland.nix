{ lib, ... }: {
  xdg.configFile."hypr" = {
    source = lib.mkForce ../dotfiles/hypr;
    recursive = true;
  };
}
