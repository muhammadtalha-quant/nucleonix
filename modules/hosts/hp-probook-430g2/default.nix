{ pkgs, ... }: {

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-media-sdk
    ];
  };
  hardware.facter.reportPath = ./hardware_report.json;
}
