{
  inputs,
  den,
  disko,
  ...
}:
{
  hosts.hp-probook-430g2 = {
    includes = [
      (den.aspects.core {
        timeZone = "Asia/Karachi";
        hashedPassword = "$y$j9T$CXXX951qyBSRGHfHxZ8E01$ooy/jGSGAqWqdNQ0WA9pMbjibDGYoA2jsmDU8GJhbv2";
      })
      (disko.ext4-simple {
        deviceName = "/dev/sda";
        swapSize = "4G";
      })
    ];
    nixos =
      { pkgs, ... }:
      {
        imports = [
          inputs.disko.nixosModules.disko
        ];
        hardware = {

          graphics = {
            enable = true;
            extraPackages = with pkgs; [
              intel-media-driver
            ];
          };
          bluetooth.enable = true;
          bluetooth.powerOnBoot = true;

          facter.reportPath = ./hp-probook-430g2.json;
        };
      };
  };
}
