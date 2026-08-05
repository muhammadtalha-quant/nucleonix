{ pkgs-unstable, ... }: {
    programs = {
        starship = {
            enable = true;
            enableFishIntegration = true;
            settings = builtins.fromTOML (builtins.readFile ../raw/starship/config.toml);
        };
        fastfetch = {
            enable = true;
            settings = builtins.fromJSON (builtins.readFile ../raw/fastfetch/config.jsonc);
        };
        noctalia = {
            enable = true;
            package = pkgs-unstable.noctalia;
            settings = ../raw/noctalia_shell/config.toml;
        };
        cava.enable = true;
        btop.enable = true;
        satty.enable = true;
    };
}
