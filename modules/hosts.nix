{ den, hosts, ... }:
{
  den.hosts.x86_64-linux.hp-probook-430g2 = {
    includes = [
      hosts.hp-probook-430g2
      den.aspects.hyprland-desktop-environment
    ];
    users.muhammadtalha = { };
  };
}
