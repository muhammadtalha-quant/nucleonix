{ den, dots, ... }: {
  den.aspects.hyprland-desktop-environment = { user, ... }: {
    includes = [
      (dots.vcs {
        realName = "Muhammad Talha";
        emailAddress = "muhammadtalha.quant@gmail.com";
        publicGPGKey = "33DF23031DE1A83C";
      })
      (dots.wm { theme = "dark"; })
      (dots.noctalia { theme = "dark"; })
      (dots.lazyvim { theme = "dark"; })
      (dots.shell { theme = "dark"; })
      (dots.terminal { theme = "dark"; })
      (dots.styling { theme = "dark"; })
      dots.xdg-integration
      dots.independent-packages
      dots.wheels
    ];
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        newcomputermodern
      ];
      environment = {
        sessionVariables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
          QT_QPA_PLATFORM = "wayland;xcb";
          NIXOS_OZONE_WL = "1";
          FLAKE_PATH = "/home/${user.userName}";
        };
        systemPackages = with pkgs; [
          gpu-screen-recorder
          unar
          rar
          _7zz
        ];
      };
      networking = {
        firewall = {
          allowedTCPPorts = [ 53317 ];
          allowedUDPPorts = [ 53317 ];
        };
      };
      programs = {
        localsend.enable = true;
        seahorse.enable = true;
        gnupg.agent = {
          pinentryPackage = pkgs.pinentry-gnome3;
          settings = {
            default-cache-ttl = 43200;
            max-cache-ttl = 43200;
          };
        };
      };
      security = {
        rtkit.enable = true;
        pam.services.greetd = {
          enableGnomeKeyring = true;
          fprintAuth = true;
        };
      };
      services = {
        power-profiles-daemon.enable = true;
        upower.enable = true;
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
          dataDir = "/home/${user.userName}";
          user = user.userName;
          openDefaultPorts = true;
          overrideFolders = true;
          group = "users";
          settings = {
            devices = {
              myphone = {
                id = "7XVOG6S-6BTWJNS-MHZ4QLW-YG4NWLD-JHD7ODT-ANKSLBW-CQMTKVZ-PAYT2QV";
                addresses = [ "dynamic" ];
              };
            };
            folders = {
              "/home/${user.userName}/sync" = {
                enable = true;
                id = "sync";
                devices = [ "myphone" ];
              };
            };
          };
        };
      };
    };
  };
}
