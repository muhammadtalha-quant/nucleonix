{ hostName, ... }:
{
  networking = {
    inherit hostName;
    firewall = {
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };
}
