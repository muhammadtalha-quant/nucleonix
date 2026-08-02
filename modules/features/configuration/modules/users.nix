{
    pkgs,
    userName,
    realName,
    ...
}:
{
    users = {
        mutableUsers = false;
        users.root.hashedPassword = "$y$j9T$hbguh04FZh1JSM8nYVXS0.$9yG.bzlFyYT2NcDEKwxPmZuyN1Cz91DMpyewyfQAyM5";
        users.${userName} = {
            isNormalUser = true;
            description = realName;
            extraGroups = [
                "networkmanager"
                "wheel"
            ];
            shell = pkgs.fish;
            hashedPassword = "$y$j9T$hbguh04FZh1JSM8nYVXS0.$9yG.bzlFyYT2NcDEKwxPmZuyN1Cz91DMpyewyfQAyM5";
        };
    };
}
