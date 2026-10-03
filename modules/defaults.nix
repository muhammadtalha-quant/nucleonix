{ lib, den, ... }:
{
  den = {
    default.nixos.system.stateVersion = "26.05";
    default.homeManager.home.stateVersion = "26.05";

    schema.user.classes = lib.mkDefault [ "homeManager" ];

    aspects.tux.nixos = { };
  };
}
