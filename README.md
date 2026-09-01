# nix-darwin config

My macOS setup, managed with [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager): CLI tools, fonts, Homebrew casks, Nushell, Ghostty, and a few system defaults.

## Setup from scratch

**1. Install Nix**

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

The config keeps `nix.enable = false`, so the daemon stays managed by this installer instead of nix-darwin.

**2. Clone the repo**

```sh
git clone git@github.com:noel-debug/nix-darwin.git ~/.config/nix-darwin
```

**3. Build and switch**

```sh
nix run nix-darwin -- switch --flake ~/.config/nix-darwin#Noels-MacBook-Air
```

This installs everything (Homebrew included, if missing) and adds `darwin-rebuild` to your PATH.

## Daily usage

Apply local configuration changes:

```sh
darwin-rebuild switch --flake ~/.config/nix-darwin#Noels-MacBook-Air
```

## Updating packages

Update all flake inputs (`nixpkgs`, `nix-darwin`, `home-manager`) and switch:

```sh
# 1. Update the lockfile
nix flake update --flake ~/.config/nix-darwin

# 2. Apply updates
darwin-rebuild switch --flake ~/.config/nix-darwin#Noels-MacBook-Air
```

Or do both in a single step:

```sh
darwin-rebuild switch --flake ~/.config/nix-darwin#Noels-MacBook-Air --recreate-lock-file
```

To clean up old package generations and reclaim disk space:

```sh
nix-collect-garbage -d
```

## Structure

```
├── flake.nix               # Inputs and the Noels-MacBook-Air configuration
├── modules/                # Shared packages and fonts
├── hosts/macbook-air/      # Host settings: user, sudo, defaults, Homebrew
└── home/noel/              # home-manager: nushell, ghostty
```
