# Nucleonix — NixOS Configuration Based on Nucleus Architecture

<!--toc:start-->

- [Nucleonix — NixOS Configuration Based on Nucleus Architecture](#nucleonix-nixos-configuration-based-on-nucleus-architecture)
  - [Tree Structure](#tree-structure)
  - [How I Would Reproduce My Exact System ?](#how-i-would-reproduce-my-exact-system)
    - [Clone The Template Repository](#clone-the-template-repository)
    - [Preparation and Installation](#preparation-and-installation)

<!--toc:end-->

Nucleonix is my personal configuration based on the very lightweight
[nucleus architecture](https://github.com/muhammadtalha-quant/nucleus-template).

## Tree Structure

```text
 .
├──  flake.lock
├──  flake.nix
├──  modules
│   ├──  common
│   │   └──  disko.nix
│   ├──  features
│   │   ├──  configuration
│   │   │   ├──  configuration.nix
│   │   │   └──  modules
│   │   │       ├──  bootloader.nix
│   │   │       ├──  hardware.nix
│   │   │       ├──  i18n.nix
│   │   │       ├──  networking.nix
│   │   │       ├──  nh.nix
│   │   │       ├──  nix.nix
│   │   │       ├──  programs.nix
│   │   │       ├──  security.nix
│   │   │       ├──  services.nix
│   │   │       ├──  stylix.nix
│   │   │       ├──  users.nix
│   │   │       └──  xdg.nix
│   │   └──  dotfiles
│   │       ├──  home.nix
│   │       ├──  modules
│   │       │   ├──  fish.nix
│   │       │   ├──  git.nix
│   │       │   ├──  kitty.nix
│   │       │   ├──  niri.nix
│   │       │   ├──  programs.nix
│   │       │   ├──  tmux.nix
│   │       │   └──  yazi.nix
│   │       ├──  neovim
│   │       │   ├──  init.nix
│   │       │   ├──  keymap.nix
│   │       │   ├──  languages.nix
│   │       │   ├──  luaConfigRC
│   │       │   │   └──  lualine.nix
│   │       │   ├──  opts.nix
│   │       │   ├──  plugins
│   │       │   │   ├──  blink.nix
│   │       │   │   ├──  dashboard.nix
│   │       │   │   ├──  diagnostics.nix
│   │       │   │   ├──  lualine.nix
│   │       │   │   ├──  mini.nix
│   │       │   │   ├──  toggleterm.nix
│   │       │   │   └──  visuals.nix
│   │       │   ├──  theme.nix
│   │       │   ├──  ui2.nix
│   │       │   └──  utils.nix
│   │       └──  raw
│   │           ├──  fastfetch
│   │           │   └──  config.jsonc
│   │           ├──  niriwm
│   │           │   ├──  config.kdl
│   │           │   └──  modules
│   │           │       ├──  inputs.kdl
│   │           │       ├──  keybinds.kdl
│   │           │       ├──  layerrules.kdl
│   │           │       ├──  monitors.kdl
│   │           │       └──  windowrules.kdl
│   │           ├──  noctalia_shell
│   │           │   └──  config.toml
│   │           └──  starship
│   │               └──  config.toml
│   └──  hosts
│       └──  hp-probook-430g2
│           ├──  default.nix
│           └──  hardware-configuration.nix
│           
└── 󰂺 README.md ← You are reading !
```

## How I Would Reproduce My Exact System ?

I would follow these exact steps in sequence.

### Clone The Template Repository

- Clone the template repository
  - Enter root mode as suggested in the NixOS Manual.
  - Since `git` is not available in the minimal ISO of NixOS, we have to
    temporarily install it.
  - Clone the repository.
  - Exit the fake shell, in which git was installed.
  - Remove the `.git` directory, so that the process doesn't throw errors errors
    regarding impurity.

```bash
sudo -i 
nix-shell -p git 
git clone https://github.com/muhammadtalha-quant/nucleus-template.git
exit 
cd nucleus-template/ 
rm -rf .git
```

### Preparation and Installation

- Know about my disk by running the following command.

```bash
lsblk
```

- Open **flake.nix** and do necessary changes according to my requirements.

```bash
nano flake.nix
```

- Run disko to handle formatting, partitioning and mounting of my disk.

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount -f .#host
```

> [!IMPORTANT]
> If my host is laptop, I will check out
> [services.nix](modules/features/configuration/modules/services.nix) and enable
> power management services.

- Installing NixOS
  - Go to parent directory of template repo.
  - Move repository to `/mnt` so that it is available after installation.
  - Change directory to repository in the new location.
  - Generate configuration in the `host` directory.
  - Remove the generated `configuration.nix` stub.
  - Install NixOS from the modified template and do not prompt for root
    password.

```bash
cd .. 
mv nucleus-template /mnt/
cd /mnt/nucleus-template/
nixos-generate-config --root . --dir modules/hosts/host/ --no-filesystems
rm modules/hosts/host/configuration.nix
nixos-install --flake .#host --no-root-passwd
```

> [!CAUTION]
> The above steps will only work for me. If you want to reproduce my exact
> system, you should definitely read the
> [**documentation**](https://github.com/muhammadtalha-quant/nucleus-template/blob/main/README.md).
