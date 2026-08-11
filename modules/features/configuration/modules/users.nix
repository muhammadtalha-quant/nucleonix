{
  pkgs,
  userName,
  realName,
  hashedRootPassword,
  hashedUserPassword,
  ...
}:
{
  users = {
    mutableUsers = false;
    users.root.hashedPassword = hashedRootPassword;
    users.${userName} = {
      isNormalUser = true;
      description = realName;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.fish;
      hashedPassword = hashedUserPassword;
    };
  };
}
