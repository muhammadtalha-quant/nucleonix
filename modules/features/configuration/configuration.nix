{
    inputs,
    pkgs,
    lib,
    hostName,
    timeZone,
    configDirectory,
    locale,
    disabledOSTargets,
    ...
}:

{
    imports = [
        ../../hosts/${hostName}/default.nix
        (inputs.import-tree ./modules)
    ];

    stylix.targets = lib.foldl' (
        acc: target: lib.recursiveUpdate acc (lib.setAttrByPath [ target "enable" ] false)
    ) { } disabledOSTargets;

    environment.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        FLAKE_PATH = configDirectory;
        LANG = locale;
    };
    fonts.packages = with pkgs; [
        newcomputermodern
    ];
    environment.systemPackages = with pkgs; [
        neovim-unwrapped
        nix-output-monitor
        xwayland-satellite
        zip
        unzip
        _7zz
        file
        gcc
        seahorse
        yt-dlp
    ];

    time.timeZone = timeZone;
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "26.05";

}
