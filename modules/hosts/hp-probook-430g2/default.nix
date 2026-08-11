{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
    ];
  };

  boot.kernelParams = [
    "iwlwifi.power_save=0"
    "iwlwifi.uapsd_disable=1"
  ];
}
