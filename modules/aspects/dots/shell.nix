{
  dots.shell = { theme }: {
    homeManager = { pkgs, ... }: {
      programs.starship = {
        enable = true;
        enableFishIntegration = true;
        settings =
          if theme == "dark" then
            builtins.fromTOML (builtins.readFile ./raw-dotfiles/starship/macchiato.toml)
          else if theme == "light" then
            builtins.fromTOML (builtins.readFile ./raw-dotfiles/starship/latte.toml)
          else
            { };
      };
      programs.fish = {
        enable = true;
        shellAbbrs = {
          ls = "eza --icons";
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
          la = "eza -ah --icons";
          lt = "eza --tree --git";
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
          sumkdir = "sudo mkdir -p";
          cp = "cp -rv";
          mv = "mv -v";
          rm = "rm -frv";
          less = "less -R";
          sucp = "sudo cp -rv";
          sumv = "sudo mv -v";
          surm = "sudo rm -frv";
          cls = "clear";
        };
        preferAbbrs = true;
        shellAliases = {
          home = "cd ~";
          ".." = "cd ..";
          "..." = "cd ../..";
          "...." = "cd ../../..";
          v = "nvim";
          vi = "nvim";
          vim = "nvim";
          cat = "bat";
          matrix = "cmatrix -rsbu5";
          pipes = "pipes.sh -p4 -r4000 -R";
          fastfetch = "microfetch";
          # nixos-switch = "nh os switch";
          # nixos-boot = "nh os boot";
          # nixos-purge-all = "nh clean all --optimise; sudo rm -frv /nix/var/nix/profiles/{system-*,per-user/*}; sudo mkdir -p /nix/var/nix/profiles/per-user/{root/channels,${params.userName}}; nh os boot";
          # nixos-test = "nh os test";
          # nixos-info = "nh os info";
          # nixos-rollback = "nh os rollback --to";
          nixos-update = "nix flake update --flake $FLAKE_PATH";
        };
        shellInit = "set -U fish_greeting";
        shellInitLast = "microfetch";
        plugins = with pkgs.fishPlugins; [
          {
            name = "autopair";
            inherit (autopair) src;
          }
        ];
        functions.clh.body = ''
          echo yes | history clear
          clear && fish
        '';
      };
    };
  };
}
