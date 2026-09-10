{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];


  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-media-sdk
    ];
  };

}
