{
    pkgs,
    lib,
    inputs,
    userName,
    disabledHMTargets,
    ...
}:

{

    imports = [
        inputs.lazyvim.homeManagerModules.default
        inputs.noctalia-shell.homeModules.default
        (inputs.import-tree ./modules)
    ];

    programs.home-manager.enable = true;

    stylix.targets = lib.foldl' (
        acc: target: lib.recursiveUpdate acc (lib.setAttrByPath [ target "enable" ] false)
    ) { } disabledHMTargets;

    home = {
        username = userName;
        homeDirectory = "/home/${userName}";
        packages = with pkgs; [
            google-chrome
            wl-clipboard
            ouch
            trash-cli
            celluloid
            loupe
            obsidian
            gh
            lazygit
            eza
            papers
        ];
        pointerCursor.enable = true;
        stateVersion = "26.05";
    };

}
