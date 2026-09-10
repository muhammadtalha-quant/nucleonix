{ userName, extraSpecialArgs, ... }: {
  home-manager = {
    inherit extraSpecialArgs;
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userName} = import ./home.nix { inherit userName; };
    backupFileExtension = "backup";
  };
}
