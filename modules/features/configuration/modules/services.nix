{
  userName,
  deviceID,
  ...
}:
{
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
    fprintd.enable = true;
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
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
        folders = {
          "/home/${userName}/sync" = {
            enable = true;
            id = "sync";
            devices = [ "myphone" ];
          };
        };
        devices = {
          myphone.id = deviceID;
          myphone.addresses = [ "dynamic" ];
        };
      };

    };
  };
}
