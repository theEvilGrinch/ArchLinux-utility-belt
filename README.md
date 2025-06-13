# ArchLinux Utility Belt

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)

[![Support me on Boosty](https://img.shields.io/badge/Boosty-Support%20me-%23f15f2c?style=for-the-badge)](https://boosty.to/theEvilGrinch/donate)
[![Donate](https://img.shields.io/badge/Donate-%23702ff4?style=for-the-badge)](https://yoomoney.ru/to/410016288289737)

## Overview

A comprehensive collection of configurations, utilities, and automation scripts for Arch Linux power users. This repository provides a curated set of tools and settings to transform a fresh Arch installation into a highly optimized development environment.

### Key Benefits
- **Custom ZSH functions** for development automation
- **Performance-tuned configurations** for linux-zen kernel, Nvidia GPU, and Btrfs filesystem
- **Production-ready templates** for Docker, systemd, and more
- **Modular design** - use only what you need

## Table of Contents

- [Overview](#overview)
- [Disclaimer](#disclaimer)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Repository Structure](#repository-structure)
- [Usage](#usage)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)

## Disclaimer

- **Use at your own risk.** These configurations are highly personalized for specific hardware and software choices.
- **Hardware Specificity**: Configurations are optimized for systems with Nvidia GPU, linux-zen kernel, and Btrfs filesystem. Optional Intel GPU support is available via `configs/20-intel.conf`.
- **Backup First**: Always back up existing configurations before replacing them.
- **Review Before Use**: Carefully inspect files before applying them to your system. Each configuration file includes header comments indicating its target location.

## Features

### System Optimization
- **Kernel Performance**: Custom parameters for linux-zen kernel with Btrfs-specific optimizations
- **Memory Management**: Configured systemd-oomd for intelligent out-of-memory handling
- **Build System**: Optimized makepkg configuration for faster AUR builds

### Development Productivity
- **Git Workflow**: Enhanced git plugin
- **Media Processing**: Batch convert, optimize, and translate video/audio files
- **Template Generation**: Instantly scaffold Docker, systemd, and project files

### Modular Architecture
- **Selective Installation**: Each component can be used independently
- **Clear Documentation**: Every module includes its own detailed README
- **Flexible Configuration**: Adapt configurations to your specific needs

## Prerequisites

- Arch Linux (or Arch-based distribution)
- ZSH shell with Oh-My-ZSH framework
- Git version 2.0+
- Node and npm

Additional dependencies may be required for specific modules. Please refer to individual README files in each directory for detailed requirements.

## Repository Structure

```
ArchLinux-utility-belt/
├── configs/                        # System and application configurations
│   ├── 20-intel.conf               # Xorg Intel GPU configuration
│   ├── 99-custom.conf              # Kernel parameters optimization
│   ├── .makepkg.conf               # Build system configuration
│   ├── .oomd.conf                  # Systemd-oomd memory management
│   ├── grub                        # GRUB bootloader configuration
│   ├── .htaccess                   # Apache security hardening
│   ├── .npmrc                      # NPM global settings
│   ├── .zshrc                      # Main ZSH configuration
│   ├── .zshrc_default              # Default Oh-My-ZSH config
│   ├── mkinitcpio.conf             # Initramfs generation (Nvidia/Btrfs)
│   ├── web-search.plugin.zsh       # Terminal web search integration
│   └── git.plugin.zsh              # Enhanced git functionality
├── fonts/                          # Curated programming fonts (TTF)
│   └── [various font files]        # FiraCode, MartianMono, OpenSans, etc.
├── .zfunc/                         # Custom ZSH functions library
│   ├── fn_youtube_video_translate  # YouTube video translation
│   ├── fn_optimize_images          # Batch image optimization
│   ├── fn_convert_media            # Media format conversion
│   ├── fn_convert_media_batch      # Bulk media conversion
│   ├── fn_git_clone_template       # Clone without git history
│   ├── fn_ask_ai                   # Interactive AI chat via OpenRouter API
│   ├── fn_init_repo                # Initialize git repository with basic files
│   ├── fn_new_gitignore            # Generate .gitignore from template
│   ├── fn_new_libreoffice_doc      # Create formatted LibreOffice document
│   ├── fn_new_Dockerfile           # Generate Dockerfile template
│   ├── fn_new_docker_compose       # Generate docker-compose.yaml
│   ├── fn_new_dockerignore         # Generate .dockerignore
│   ├── fn_new_desktop_file         # Create desktop entry
│   ├── fn_new_timer                # Generate systemd timer
│   ├── fn_new_system_service       # Generate system service
│   └── fn_new_user_service         # Generate user service
├── templates/                      # Production-ready file templates
│   ├── Dockerfile                  # Node.js Alpine template
│   ├── docker-compose.yaml         # Multi-container setup
│   ├── .dockerignore               # Docker ignore patterns
│   ├── desktop-file.desktop        # Application launcher template
│   ├── example-system.service      # System service template
│   ├── example-user.service        # User service template
│   ├── example-timer.timer         # Systemd timer template
│   ├── git-commit-template_ru.txt  # Commit template (Russian)
│   ├── git-commit-template_en.txt  # Commit template (English)
│   ├── .gitignore                  # Comprehensive ignore patterns
│   └── libreoffice.ott             # Document template
├── LICENSE                         # MIT License
└── README.md                       # Project documentation
```

## Usage

### Getting Started

Clone the repository:
```bash
git clone https://github.com/theEvilGrinch/ArchLinux-utility-belt.git
cd ArchLinux-utility-belt
```

### Applying Configurations

You have two options for using the configurations:
1. **Copy files** to their target locations (recommended for system files)
2. **Create symbolic links** for configurations that support it

#### Example: Setting up ZSH configuration

```bash
# Create a backup of your existing configuration
cp ~/.zshrc ~/.zshrc.backup

# Option 1: Copy the file
cp configs/.zshrc ~/

# Option 2: Create a symbolic link
ln -s $(pwd)/configs/.zshrc ~/.zshrc

# Reload the configuration
source ~/.zshrc
# or
exec zsh
```

### Important Notes

- Git commit templates (`git-commit-template_*.txt`) must be referenced by their full path in git configuration rather than using symbolic links:
  ```bash
  git config --global commit.template /path/to/ArchLinux-utility-belt/templates/git-commit-template_en.txt
  ```
- Each configuration file contains a header comment specifying its target location in the system
- Some configurations may require additional setup steps - refer to module-specific documentation

## Documentation

Each module in this repository has its own comprehensive README with:
- Detailed installation instructions
- Configuration options
- Usage examples
- Troubleshooting guides

### Module documentation:
- [`configs/README.md`](configs/README.md) - System and application configuration details
- [`fonts/README.md`](fonts/README.md) - Font installation and usage guide
- [`templates/README.md`](templates/README.md) - Template file documentation
- [`.zfunc/README.md`](.zfunc/README.md) - ZSH function reference and examples

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

⚡ Maintained by [@theEvilGrinch](https://github.com/theEvilGrinch)
