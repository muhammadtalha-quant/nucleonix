{
  inputs,
  pkgs,
  locale,
  ...
}@others:
{
  imports = [
    (inputs.import-tree ./modules)
  ];
  services.dbus.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.fish.enable = true;
  environment = {
    sessionVariables = {
      LANG = locale;
    };
    systemPackages = with pkgs; [
      nix-output-monitor
      ripgrep
      _7zz
      zip
      eza
      bat
      unzip
      git
      gh
      neovim
      others.pkgs-unstable.devenv
    ];
  };
}
