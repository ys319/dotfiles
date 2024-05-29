# Dotfiles

**NOTE:** These Dotfiles are tailored for my personal use, and may change system settings beyond what you might normally expect.  
Please review the configuration files carefully before use to avoid unintended modifications to your system.

## Prerequisites

Before applying the Dotfiles, make sure to install the following tools:

1. **Determinate Systems Nix Installer**
2. **Homebrew**

### Install Nix

To install Nix using the Determinate Systems Nix installer, run this command:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Follow the on-screen instructions to complete the installation.

### Install Homebrew

To install Homebrew, run this command:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the on-screen instructions to complete the installation.

## Apply Dotfiles

Once you have installed Nix and Homebrew, you can apply the Dotfiles using the provided bootstrap script.

1. Clone this repository:

```sh
git clone https://github.com/ys319/dotfiles
cd dotfiles
```

2. Run the bootstrap script to apply Nix-darwin configurations:

```sh
./bootstrap-darwin.sh [hostname]
```
