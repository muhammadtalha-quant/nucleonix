{ lib, ... }: {
  xdg.configFile."hypr" = {
    source = lib.mkForce ../raw/hypr;
    recursive = true;
  };
}
