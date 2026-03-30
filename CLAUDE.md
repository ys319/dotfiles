## Overview

Nix Flakes-based dotfiles managing multiple hosts (macOS via nix-darwin, NixOS, WSL, Raspberry Pi). All configuration is declarative Nix — no symlinks, stow, or chezmoi.

## Commands

Uses [Task](https://taskfile.dev/) runner. Host is auto-detected via `hostname`.

```bash
task build          # Build all (nixos/darwin system + home-manager)
task switch         # Apply all configurations
task test           # Test nixos/darwin system configs
task update         # nix flake update
task gc             # Garbage collect (older than 14 days)
```

Platform-specific sub-tasks (e.g. `build.nixos`, `switch.darwin`, `switch.home`) are internal and auto-selected by platform.

Bootstrap for new machines:
```bash
./bootstrap-darwin.sh [hostname]   # macOS
./bootstrap-nixos.sh [hostname]    # NixOS
./bootstrap-home.sh [hostname]     # Home Manager only
```

## Architecture

### Flake Structure

`flake.nix` produces three output types from a shared host registry:
- `homeConfigurations` — user-level config via Home Manager
- `darwinConfigurations` — macOS system config via nix-darwin
- `nixosConfigurations` — Linux system config via NixOS

### Host Registry (`hosts/default.nix`)

Each host declares a `system` (e.g. `aarch64-darwin`, `x86_64-linux`) and a list of `features` to compose. Host-specific system modules live in `hosts/<hostname>/default.nix`.

### Feature-Based Module Composition

Home Manager modules are organized into feature directories under `home/`:
- `home/base/` — always included (zsh, git, starship, fzf, core utilities)
- `home/darwin/` — macOS-specific (duti file associations)
- `home/develop/` — development tools (rust, go, node/volta, direnv, cloud CLIs)
- `home/apps/` — GUI applications (vscode, chrome, wezterm, discord)

Each host selects features in `hosts/default.nix`; `mkHome.nix` prepends `"base"` automatically.

### Builder Helpers (`lib/`)

- `mkHome.nix` — builds `homeManagerConfiguration` from host config, importing `home/<feature>` directories
- `mkSystem.nix` — polymorphic builder for both NixOS and Darwin system configs, loading `hosts/<hostname>` modules
- `mkModules.nix` — recursively scans directories into nested attribute sets of imported Nix modules

### System Modules

- `nixos/` — NixOS system modules (ssh, docker, networking, hardware, desktop)
- `darwin/` — nix-darwin system modules

These are loaded via `mkModules` and passed to system builders as `specialArgs`.

## Conventions

- Language is Nix; comments in source are sometimes Japanese
- `nixpkgs-unstable` channel; `allowUnfree = true`
- Zsh plugins use Sheldon with `zsh-defer` for lazy loading
- Rust toolchain comes from `oxalica/rust-overlay`
- Node.js managed via Volta (not nix)
