# ArchLinux Utility Belt

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

[![Support me on Boosty](https://img.shields.io/badge/Boosty-Support%20me-%23f15f2c?style=for-the-badge)](https://boosty.to/theEvilGrinch/donate)
[![Donate](https://img.shields.io/badge/Donate-%23702ff4?style=for-the-badge)](https://yoomoney.ru/to/410016288289737)

## Table of Contents

- [Overview](#overview)
- [Disclaimer](#disclaimer)
- [Features](#features)
- [Repository Structure](#repository-structure)
- [Documentation](#documentation)
- [License](#license)

## Overview

This project offers a curated set of configurations and utilities for Arch Linux. It aims to simplify system setup, automate routine tasks, and provide a robust foundation for development and general use. The configurations are modular and can be adapted to individual needs.

## Disclaimer

- **Use at your own risk.** These configurations are highly personalized for my hardware and software choices.
- **Hardware Specificity**: Configurations target Nvidia GPU, linux-zen kernel, Btrfs filesystem, optional internal Intel GPU support via `configs/20-intel.conf`.
- **Backup First**: Always back up existing configurations before replacing them.
- **Review Before Use**: Carefully inspect files before applying them to your system. Each file includes a header comment indicating its target location.

## Features

- **Modularity**: Configurations are split into logical units for easy management.
- **Automation**: ZSH functions and utilities automate common development and administration tasks.
- **Performance**: Settings are optimized for performance and security on a `linux-zen` kernel with a Btrfs filesystem.

## Repository Structure

```
ArchLinux-utility-belt/
├── configs/                        # System and application configurations
│   ├── 20-intel.conf               # Xorg Intel GPU configuration
│   ├── 99-custom.conf              # Kernel parameters optimization
│   ├── .makepkg.conf               # Build system configuration
│   ├── .oomd.conf                  # Systemd-oomd out-of-memory management config
│   ├── grub                        # GRUB boot loader configuration
│   ├── .htaccess                   # Apache server configuration with security and performance settings
│   ├── .npmrc                      # NPM global settings
│   ├── .zshrc                      # Main ZSH configuration
│   ├── .zshrc_default              # Default Oh-My-ZSH config
│   ├── mkinitcpio.conf             # Initramfs generation (Nvidia/Btrfs)
│   ├── web-search.plugin.zsh       # Terminal search plugin
│   └── git.plugin.zsh              # Custom Oh-My-ZSH plugin for git
├── fonts/                          # Font collections (TTF)
│   └── [various font files]        # FiraCode, MartianMono, OpenSans, etc.
├── .zfunc/                         # Custom ZSH functions
│   ├── fn_youtube_video_translate  # Download and translate YouTube videos
│   ├── fn_optimize_images          # Optimize images in directory
│   ├── fn_convert_media            # Convert audio or video file to another format
│   ├── fn_convert_media_batch      # Convert multiple audio or video files
│   ├── fn_git_clone_template       # Clone Git repository as template without Git history
│   ├── fn_new_gitignore            # Create new .gitignore file from template
│   ├── fn_new_libreoffice_doc      # Create new formated LibreOffice document 
│   ├── fn_new_Dockerfile           # Create new Dockerfile from template 
│   ├── fn_new_docker_compose       # Create new docker-compose.yaml file from template
│   ├── fn_new_dockerignore         # Create new .dockerignore file from template
│   ├── fn_new_desktop_file         # Create new .desktop file
│   ├── fn_new_timer                # Create new systemd timer unit 
│   ├── fn_new_system_service       # Create new system-level systemd service unit 
│   └── fn_new_user_service         # Create new user-level systemd service unit 
├── templates/                      # File generation templates
│   ├── Dockerfile                  # Template Dockerfile for Node.js applications (Alpine-based)
│   ├── docker-compose.yaml         # Multi-container Docker Compose template
│   ├── .dockerignore               # Docker build context exclude patterns
│   ├── desktop-file.desktop        # Template for desktop entries
│   ├── example-system.service      # Systemd unit template (system-wide)
│   ├── example-user.service        # Systemd unit template (user)
│   ├── example-timer.timer         # Systemd timer unit template
│   ├── git-commit-template_ru.txt  # Git commit message template (with Russian comments)
│   ├── git-commit-template_en.txt  # Git commit message template (with English comments)
│   ├── .gitignore                  # Comprehensive Git ignore template
│   └── libreoffice.ott             # LibreOffice template document
├── LICENSE                         # MIT License
└── README.md                       # Main documentation
```

## Documentation
This `README.md` provides a high-level overview. **Each module in this repository has its own detailed `README.md` file** with specific installation and usage instructions.

- [`configs/README.md`](configs/README.md): System and application configuration details.
- [`fonts/README.md`](fonts/README.md): Font installation and usage.
- [`templates/README.md`](templates/README.md): Template file documentation.
- [`.zfunc/README.md`](.zfunc/README.md): ZSH function documentation.

## License

MIT Licensed - See [LICENSE](LICENSE) for details.

--- 

⚡ Maintained by [@theEvilGrinch](https://github.com/theEvilGrinch)
