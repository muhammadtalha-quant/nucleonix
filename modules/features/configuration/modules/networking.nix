{ hostName, ... }:
{
    networking = {
        inherit hostName;
        firewall = {
            enable = true;
            allowedTCPPorts = [ 53317 ];
            allowedUDPPorts = [ 53317 ];
        };
        networkmanager.enable = true;
    };
}
