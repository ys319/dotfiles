# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

All commands use [Task](https://taskfile.dev/) (see `Taskfile.yml`):

```bash
task build          # Build all configs (home-manager + system)
task switch         # Apply all configs
task test           # Test configs (NixOS/Darwin only, not home-manager)
task update         # Update flake inputs (nix flake update)
task gc             # Garbage collect generations older than 14 days
task news           # Show home-manager news
```

Per-platform variants: `task build.darwin`, `task switch.darwin`, `task build.home`, `task switch.home`, etc.

## Architecture

This is a **Nix Flakes** repository managing multiple systems from a single `flake.nix`.

### Flake Inputs
nixpkgs (unstable), home-manager, nix-darwin, nixos-hardware, nixos-wsl, rust-overlay

### Flake Outputs
- `homeConfigurations` — home-manager configs (all hosts)
- `darwinConfigurations` — macOS system configs
- `nixosConfigurations` — NixOS system configs

### Builders (`lib/`)
- `mkSystem.nix` — abstracts NixOS vs Darwin system building
- `mkHome.nix` — builds home-manager configurations
- `mkModules.nix` — **recursively auto-discovers all `.nix` files** in a directory tree (adding a file auto-includes it)

### Hosts (`hosts/default.nix`)
Each host declares: system architecture, feature list, and optional extra config. Features map to module subdirectories under `home/`.

| Host | System | Features |
|------|--------|----------|
| gecko-mac | aarch64-darwin | darwin, develop |
| srv01 | x86_64-linux | develop |
| rpi01 | aarch64-linux | develop |
| wsl | x86_64-linux | develop |
| x270 | x86_64-linux | apps, develop |

### Module Organization
Modules are organized by scope:
- **`home/`** — user-level config (base, darwin, develop, apps)
- **`darwin/`** — macOS system-level config (dock, finder, keyboard, homebrew)
- **`nixos/`** — NixOS system-level config (boot, hardware, network, services, desktop)

### Key Pattern
To add new configuration: create a `.nix` file in the appropriate module directory — `mkModules` auto-discovers it. To add a new host, define it in `hosts/default.nix` with its features; no changes to `flake.nix` needed.
