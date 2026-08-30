{
  userName,
  folders,
  devices,
  ...
}:
{
  services = {
    power-profiles-daemon.enable = true; # for laptops
    upower.enable = true; # for laptops
    fprintd.enable = true;
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    displayManager.ly.enable = true;
    libinput.enable = true;
    pcscd.enable = true;
    syncthing = {
      enable = true;
      dataDir = "/home/${userName}/";
      user = userName;
      openDefaultPorts = true;
      overrideFolders = true;
      group = "users";
      settings = {
        inherit folders;
        inherit devices;
      };
    };
  };
}
