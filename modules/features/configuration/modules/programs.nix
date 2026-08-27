{ pkgs, ... }:
{
  programs = {
    hyprland.enable = true;
    fish.enable = true;
    localsend.enable = true;
    seahorse.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
      enableSSHSupport = true;
      settings = {
        default-cache-ttl = 43200;
        max-cache-ttl = 43200;
      };
    };
  };
}
