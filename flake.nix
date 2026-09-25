{
  description = "A modular multi host flake that manages one complete single user NixOS system at a time, using the nucleus architecture.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      disko,
      ...
    }@inputs:
    let
      hashedRootPassword = "$y$j9T$CXXX951qyBSRGHfHxZ8E01$ooy/jGSGAqWqdNQ0WA9pMbjibDGYoA2jsmDU8GJhbv2";

      hosts = {
        hpProbook430G2 = {
          hostName = "hp-probook-430g2";
          stateVersion = "26.05";
          timeZone = "Asia/Karachi";
          disko = {
            storageDevice = "/dev/sda";
            swapSize = "4G";
          };
        };
      };

      users = {
        primary = {
          userName = "muhammadtalha";
          realName = "Muhammad Talha";
          hashedPassword = "$y$j9T$T/fyOwJSnwDN5vhbYvxOU0$xWmn12BoAIyDVChelEt7LyhGHQTMlJjd/5OEuy6Ud65";
          emailAddress = "muhammadtalha.quant@gmail.com";
          gpgKey = "33DF23031DE1A83C";
        };
      };
      # !=== ENVIRONMENT CONFIG ===!
      configDirectory = "/home/${users.primary.userName}/nucleonix/";

      # !=== HOME MANAGER ===!
      hmArgs = {
        inherit (users.primary) emailAddress;
        inherit (users.primary) userName;
        inherit (users.primary) realName;
        inherit (users.primary) gpgKey;
      };

      # !=== SYNCTHING CONFIG ===!
      devices = {
        myphone = {
          id = "7XVOG6S-6BTWJNS-MHZ4QLW-YG4NWLD-JHD7ODT-ANKSLBW-CQMTKVZ-PAYT2QV";
          addresses = [ "dynamic" ];
        };
      };
      folders = {
        "/home/${users.primary.userName}/sync" = {
          enable = true;
          id = "sync";
          devices = [ "myphone" ];
        };
      };
    in
    {
      diskoConfigurations.${hosts.hpProbook430G2.hostName} =
        import ./modules/common/disko/bare-ext4.nix hosts.hpProbook430G2.disko;
      nixosConfigurations.${hosts.hpProbook430G2.hostName} = nixpkgs.lib.nixosSystem {
        inherit
          (
            (builtins.fromJSON (
              builtins.readFile ./modules/hosts/${hosts.hpProbook430G2.hostName}/hardware_report.json
            ))
          )
          system
          ;
        specialArgs = {
          inherit hashedRootPassword;
          inherit hmArgs;
          inherit inputs;
          inherit configDirectory;
          inherit users;
          inherit (hosts.hpProbook430G2.disko) swapSize;
          inherit (hosts.hpProbook430G2.disko) storageDevice;
          inherit (hosts.hpProbook430G2) hostName;
          inherit (hosts.hpProbook430G2) timeZone;
          inherit (hosts.hpProbook430G2) stateVersion;
          inherit devices;
          inherit folders;
        };
        modules = [
          ./modules/common/nixos-core/core.nix
          ./modules/features/workstation/workstation.nix
          ./modules/features/virtualisation/virtualisation.nix
          ./modules/hosts/${hosts.hpProbook430G2.hostName}/default.nix
          home-manager.nixosModules.home-manager
          ./modules/features/home-manager/decl.nix
          disko.nixosModules.disko
          ./modules/common/disko/laptop.nix
        ];
      };
    };
}
