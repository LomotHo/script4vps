# script4vps

Personal terminal configuration & VPS initialization toolkit.

**Before installing**, replace `config/authorized_keys` and `config/gitconfig` with your own.

## Quick Start

```bash
git clone https://git.lomot.top/lomot/script4vps.git
cd script4vps
bash install.sh
```

## Usage

```bash
# Install default modules (base, shell) for current user
bash install.sh

# Install all modules
bash install.sh --modules base,shell,ssh,docker

# Specify a different username
bash install.sh --user lomot

# Use China mirrors
bash install.sh --cn

# Select theme (vps, mac, ascii)
bash install.sh --theme ascii

# List available modules
bash install.sh --list
```

### Modules

| Module   | Description                                                  |
| -------- | ------------------------------------------------------------ |
| `base`   | Install essential packages (htop, vim, tmux, zsh, git, curl) |
| `shell`  | Deploy zsh/tmux/vim/git configs, set zsh as default          |
| `ssh`    | Deploy SSH authorized_keys                                   |
| `docker` | Install Docker and configure user access                     |

> When `--user` specifies a different user, it will be created automatically.

## Uninstall

```bash
bash uninstall.sh
```

## Test with Docker

```bash
docker build -t script4vps-test -f test/Dockerfile .
docker run -it script4vps-test
```

## Structure

```
├── install.sh          # Modular installer entry point
├── uninstall.sh        # Uninstaller
├── lib/common.sh       # Logging & utility functions
├── modules/            # One script per feature module
├── vendor/             # Bundled zsh plugins (git submodules)
│   ├── fast-syntax-highlighting/
│   ├── powerlevel10k/
│   └── omz/            # OMZ lib & plugin excerpts
├── config/             # Dotfiles (zshrc, tmux, vim, git, etc.)
└── bin/                # Custom CLI tools (autotag, gbc, gbn)
```

## Test

```bash
docker run -it --rm --name script4vps-test -v "$(pwd)":/opt/script4vps ubuntu:24.04 bash
cd /opt/script4vps
bash install.sh --user testuser --modules base,shell --cn --theme ascii
su - testuser
```
