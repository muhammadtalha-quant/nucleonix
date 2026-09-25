{
  inputs,
  stateVersion,
  hmArgs,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = hmArgs // {
      inherit inputs;
      inherit (inputs) stylix;
      inherit (inputs) lazyvim;
      inherit stateVersion;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${hmArgs.userName} = import ./home.nix;
    backupFileExtension = "backup";
  };
}
