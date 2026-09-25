{ currentHost, ... }:
{
  networking = {
    inherit (currentHost) hostName;
    firewall.enable = true;
    networkmanager.enable = true;
  };
}
