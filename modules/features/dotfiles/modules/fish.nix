{ pkgs, ... }:
let
    myAbbreviations = {
        ls = "eza --icons --color=always";
        lla = "eza -lgaoh --icons --git";
        ll = "eza -lgoh --icons --git";
        lf = "eza -goh --icons --only-files --show-symlinks --git";
        ldir = "eza -goh --icons --only-dirs --show-symlinks --git";
        laf = "eza -gaoh --icons --only-files --show-symlinks --git";
        ladir = "eza -gaoh --icons --only-dirs --show-symlinks --git";
        llaf = "eza -lgaoh --icons --only-files --show-symlinks --git";
        lladir = "eza -lgaoh --icons --only-dirs --show-symlinks --git";
        llf = "eza -lgoh --icons --only-files --show-symlinks --git";
        lldir = "eza -lgoh --icons --only-dirs --show-symlinks --git";
        la = "eza -ah --icons --color=always";
        lt = "eza --tree --icons --git";
        home = "cd ~";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "000" = "chmod 000";
        "644" = "chmod 644";
        "666" = "chmod 666";
        "755" = "chmod 755";
        "777" = "chmod 777";
        "000r" = "chmod -R 000";
        "644r" = "chmod -R 644";
        "666r" = "chmod -R 666";
        "755r" = "chmod -R 755";
        "777r" = "chmod -R 777";
        snano = "sudo nano";
        mkdir = "mkdir -p";
        cp = "cp -rv";
        mv = "mv -v";
        rm = "rm -frv";
        vi = "nvim";
        lg = "lazygit";
        sucp = "sudo cp -rv";
        sumv = "sudo mv -v";
        surm = "sudo rm -frv";
        less = "less -R";
        cls = "clear";
        vim = "nvim";
        nswitch = "nh os switch";
        nboot = "nh os boot";
        ntest = "nh os test";
        fupdate = "nix flake update --flake $FLAKE_PATH";
        fm = "yazi";
        ta = "tmux attach-session -dt";
        tn = "tmux new -As";
        tl = "tmux list-sessions";
    };
    myPlugins = with pkgs.fishPlugins; [
        {
            name = "autopair";
            inherit (autopair) src;
        }
    ];
in
{
    xdg.configFile."fish/conf.d/fishenv.fish".text = ''
        set -U fish_greeting 
        fish_add_path $HOME/.local/bin
    '';
    programs.fish = {
        enable = true;
        shellAbbrs = myAbbreviations;
        preferAbbrs = true;
        shellInit = ''
            fastfetch
        '';
        plugins = myPlugins;
        functions.clh.body = ''
            clear && echo yes | history clear
            fish
        '';
    };
}
