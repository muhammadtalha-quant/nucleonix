{
  description = "A modular multi host flake that manages one complete single user NixOS system at a time, using the nucleus architecture.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    disko = {
      url = "github:nix-community/disko/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim.url = "github:pfassina/lazyvim-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      lazyvim,
      stylix,
      disko,
      ...
    }@inputs:
    let
      # !=== SYSTEM CONFIG ===!
      userName = "muhammadtalha";
      hostName = "hp-probook-430g2";
      timeZone = "Asia/Karachi";
      locale = "en_US.UTF-8";
      hashedUserPassword = "$y$j9T$T/fyOwJSnwDN5vhbYvxOU0$xWmn12BoAIyDVChelEt7LyhGHQTMlJjd/5OEuy6Ud65";
      hashedRootPassword = "$y$j9T$CXXX951qyBSRGHfHxZ8E01$ooy/jGSGAqWqdNQ0WA9pMbjibDGYoA2jsmDU8GJhbv2";

      # !=== FLAKE CONFIG ===!
      system = "x86_64-linux";
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

      # !=== USER CONFIG ===!
      realName = "Muhammad Talha";
      emailAddress = "muhammadtalha.quant@gmail.com";
      gpgKey = "33DF23031DE1A83C"; # public key

      # !=== DISKO CONFIG ===!
      storageDevice = "/dev/sda";
      swapSize = "4G"; # size of swap partition

      # !=== ENVIRONMENT CONFIG ===!
      configDirectory = "/home/${userName}/nucleonix/";

      # !=== SYNCTHING CONFIG ===!
      deviceID = "7XVOG6S-6BTWJNS-MHZ4QLW-YG4NWLD-JHD7ODT-ANKSLBW-CQMTKVZ-PAYT2QV";
    in
    {
      diskoConfigurations.${hostName} = import ./modules/common/disko.nix {
        inherit storageDevice;
        inherit swapSize;
      };
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit userName;
          inherit hashedRootPassword;
          inherit hashedUserPassword;
          inherit realName; # for user desc
          inherit hostName;
          inherit timeZone;
          inherit configDirectory;
          inherit storageDevice;
          inherit locale;
          inherit swapSize;
          inherit deviceID;
          inherit pkgs-unstable;
          inherit inputs;
        };
        modules = [
          ./modules/features/configuration/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${userName} = import ./modules/features/dotfiles/home.nix;
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit inputs;
                inherit userName;
                inherit stylix;
                inherit realName;
                inherit gpgKey;
                inherit lazyvim;
                inherit pkgs-unstable;
                inherit emailAddress;
              };
            };
          }
          disko.nixosModules.disko
          ./modules/common/disko.nix
        ];
      };
    };
}
