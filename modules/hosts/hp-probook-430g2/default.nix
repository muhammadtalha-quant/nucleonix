{ pkgs, ... }: {

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };
  hardware.facter.reportPath = ./hardware_report.json;
}
