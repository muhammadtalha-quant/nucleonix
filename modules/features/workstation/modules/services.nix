{
  userName,
  folders,
  devices,
  pkgs,
  ...
}:
let
  cursorTheme = {
    light = {
      name = "catppuccin-latte-mauve-cursors";
      package = pkgs.catppuccin-cursors.latteMauve;
    };
    dark = {
      name = "catppuccin-macchiato-mauve-cursors";
      package = pkgs.catppuccin-cursors.macchiatoMauve;
    };
  };
in
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
    displayManager.noctalia-greeter = {
      enable = true;
      settings = {
        cursor.size = 26;
        keyboard.layout = "us";
      };
      cursorTheme = cursorTheme.dark;
    };
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
