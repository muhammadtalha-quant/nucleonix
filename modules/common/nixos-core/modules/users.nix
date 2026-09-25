{
  hashedRootPassword,
  pkgs,
  users,
  ...
}:
{
  users = {
    mutableUsers = false;
    users.root.hashedPassword = hashedRootPassword;
    users = {
      ${users.primary.userName} = {
        isNormalUser = true;
        description = users.primary.realName;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.fish;
        inherit (users.primary) hashedPassword;
      };
    };
  };
}
