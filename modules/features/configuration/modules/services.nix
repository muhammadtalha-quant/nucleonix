{
    services = {
        power-profiles-daemon.enable = true;
        upower.enable = true;
        fprintd.enable = true;
        udisks2.enable = true;
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
    };
}
