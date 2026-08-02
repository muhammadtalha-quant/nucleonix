{
    pkgs,
    ...
}:
{
    stylix = {
        overlays.enable = false;
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
        polarity = "dark";
        fonts = {
            serif = {
                package = pkgs.noto-fonts;
                name = "Noto Sans";
            };

            sansSerif = {
                package = pkgs.inter;
                name = "Inter Variable";
            };

            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font Mono";
            };

            emoji = {
                package = pkgs.noto-fonts-color-emoji;
                name = "Noto Color Emoji";
            };
        };
        icons = {
            enable = true;
            package = pkgs.gruvbox-plus-icons;
            dark = "Gruvbox-Plus-Dark";
        };
        cursor = {
            name = "Capitaine Cursors (Gruvbox)";
            package = pkgs.capitaine-cursors-themed;
            size = 26;
        };
    };
}
