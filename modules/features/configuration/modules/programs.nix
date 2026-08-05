{
    pkgs,
    ...
}:
{
    programs = {
        niri.enable = true;
        nix-ld = {
            enable = true;

            libraries = with pkgs; [
                stdenv.cc.cc.lib
                zlib
                glib
                libgcc
                libffi

                openssl
                curl

                libGL
                mesa
                vulkan-loader

                alsa-lib
                libpulseaudio

                wayland
                wayland-protocols
                libxkbcommon

                libx11
                libxext
                libxcb
                libxcursor
                libxi
                libxrandr
                libxrender
                libxtst

                dbus
            ];
        };
        fish.enable = true;
        gnupg.agent = {
            enable = true;
            pinentryPackage = pkgs.pinentry-gnome3;
            enableSSHSupport = true;
            settings = {
                default-cache-ttl = 28800;
                max-cache-ttl = 28800;
            };
        };
        obs-studio.enable = true;
        dconf.enable = true;
    };
}
