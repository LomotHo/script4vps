# script4vps

Personal terminal configuration & VPS initialization toolkit.

**Before installing**, replace `config/authorized_keys` and `config/gitconfig` with your own.

## Quick Start

```bash
git clone --recursive https://github.com/lomot/script4vps.git
cd script4vps
sudo bash install.sh
```

## Usage

```bash
# Install all modules (base, user, shell, ssh, docker)
sudo bash install.sh

# Install specific modules only
sudo bash install.sh --modules shell,docker

# Specify a different username (default: lomot)
sudo USER_NAME=myuser bash install.sh

# Use China mirrors
sudo bash install.sh --cn

# List available modules
bash install.sh --list
```

### Modules

| Module   | Description                                                  |
| -------- | ------------------------------------------------------------ |
| `base`   | Install essential packages (htop, vim, tmux, zsh, git, curl) |
| `user`   | Create user and grant sudo                                   |
| `shell`  | Deploy zsh/tmux/vim/git configs, set zsh as default          |
| `ssh`    | Deploy SSH authorized_keys                                   |
| `docker` | Install Docker and configure user access                     |

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
bash install.sh --user testuser --modules base,user,shell --cn --theme container
su - testuser
```
