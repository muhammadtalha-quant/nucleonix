{
    description = "A modular multi host flake that manages a complete NixOS system one at a time, using the nucleus architecture.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        homeManager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        import-tree.url = "github:denful/import-tree";
        stylix = {
            url = "github:nix-community/stylix/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        disko = {
            url = "github:nix-community/disko/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        noctalia-shell = {
            url = "github:noctalia-dev/noctalia";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nvf = {
            url = "github:notashelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        {
            self,
            nixpkgs,
            nixpkgs-unstable,
            homeManager,
            nvf,
            disko,
            stylix,
            ...
        }@inputs:
        let
            # !=== SYSTEM CONFIG ===!
            userName = "muhammadtalha";
            hostName = "hp-probook-430g2";
            timeZone = "Asia/Karachi";
            locale = "en_US.UTF-8";
            hashedPassword = "$y$j9T$hbguh04FZh1JSM8nYVXS0.$9yG.bzlFyYT2NcDEKwxPmZuyN1Cz91DMpyewyfQAyM5";

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

            # !=== STYLIX CONFIG ===!
            disabledOSTargets = [
                "kmscon"
            ];
            disabledHMTargets = [
                "kitty"
                "btop"
                "yazi"
                "zellij"
                "nvf"
                "bat"
                "tmux"
                "starship"
                "cava"
                "lazygit"
            ];
            # !=== SYNCTHING CONFIG ===!
            deviceID = "LOW22KC-L5DK2J5-YXUJ7PZ-DDLGDU6-2IRP4EL-TJMBHPS-MB26DGN-N3X73AF";
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
                    inherit hashedPassword;
                    inherit realName; # for user desc
                    inherit hostName;
                    inherit timeZone;
                    inherit configDirectory;
                    inherit storageDevice;
                    inherit locale;
                    inherit swapSize;
                    inherit deviceID;
                    inherit pkgs-unstable;
                    inherit disabledOSTargets;
                    inherit inputs;
                };
                modules = [
                    stylix.nixosModules.stylix
                    ./modules/features/configuration/configuration.nix
                    homeManager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.${userName} = import ./modules/features/dotfiles/home.nix;
                            backupFileExtension = "bak";
                            extraSpecialArgs = {
                                inherit inputs;
                                inherit userName;
                                inherit realName;
                                inherit gpgKey;
                                inherit disabledHMTargets;
                                nvfLib = nvf.lib.nvim;
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
