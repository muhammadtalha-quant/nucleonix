{ pkgs, ... }@params:
let
  abbreviations = {
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
  aliases = {
    home = "cd ~";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    v = "nvim";
    vi = "nvim";
    vim = "nvim";
    cat = "bat";
    nixos-switch = "nh os switch";
    nixos-boot = "nh os boot";
    nixos-purge-all = "nh clean all --optimise; sudo rm -frv /nix/var/nix/profiles/{system-*,per-user/*}; sudo mkdir -p /nix/var/nix/profiles/per-user/{root,${params.userName}}; nh os boot";
    nixos-test = "nh os test";
    nixos-info = "nh os info";
    nixos-rollback = "nh os rollback --to";
    nixos-update = "nix flake update --flake $FLAKE_PATH";
  };
  fishPlugins = with pkgs.fishPlugins; [
    {
      name = "autopair";
      inherit (autopair) src;
    }
  ];
in
{
  xdg.configFile."fish/conf.d/settings.fish".text = ''
    set -U fish_greeting 
  '';
  programs.fish = {
    enable = true;
    shellAbbrs = abbreviations;
    preferAbbrs = true;
    shellAliases = aliases;
    shellInit = ''
      fastfetch
      devenv hook fish | source
    '';
    plugins = fishPlugins;
    functions.clh.body = ''
      echo yes | history clear
      clear && fish
    '';
  };
}
