{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    (inputs.import-tree ./modules)
  ];
  services.dbus.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  environment.systemPackages = with pkgs; [
    nix-output-monitor
  ];
}
