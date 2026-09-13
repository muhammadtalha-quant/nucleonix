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
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
    };
  };
  hardware.facter.reportPath = ./hardware_report.json;
}
