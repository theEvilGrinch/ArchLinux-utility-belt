# ArchLinux Utility Belt

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

[![Support me on Boosty](https://img.shields.io/badge/Boosty-Support%20me-%23f15f2c?style=for-the-badge)](https://boosty.to/theEvilGrinch/donate)
[![Donate](https://img.shields.io/badge/Donate-%23702ff4?style=for-the-badge)](https://yoomoney.ru/to/410016288289737)

## Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Features](#features)
- [System Requirements](#system-requirements)
- [Documentation](#documentation)
- [Notes](#notes)
- [License](#license)

## Overview

A comprehensive toolkit for configuring, maintaining, and enhancing Arch Linux systems. This repository provides a modular collection of curated configuration files, shell utilities, and templates designed to optimize and automate common tasks in Arch Linux environments, streamlining both system administration and development workflows.

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
│   ├── fn_youtube_video_translate  # Video translation workflow
│   ├── fn_optimize_images          # Image optimization script
│   ├── fn_convert_media            # Convert audio or video file
│   ├── fn_git_clone_template       # Clone Git repository as template without Git history
│   └── fn_convert_media_batch      # Convert multiple audio or video files from input folder
├── templates/                      # File generation templates
│   ├── Dockerfile                  # Template Dockerfile for Node.js applications based on Alpine Linux
│   ├── desktop-file.desktop        # Template for desktop entries
│   ├── exemple-system.service      # Systemd unit template (system-wide)
│   ├── example-user.service        # Systemd unit template (user)
│   ├── example-timer.timer         # Systemd timer unit template
│   ├── git-commit-template_ru.txt  # Git commit message template (with Russian comments)
│   ├── git-commit-template_en.txt  # Git commit message template (with English comments)
│   └── libreoffice.ott             # LibreOffice template document
├── LICENSE                         # MIT License
└── README.md                       # Main documentation
```
## Features

- Modular system and application configuration files
- Advanced ZSH setup with custom plugins and aliases
- Templates for systemd units, desktop entries, and development environments
- Utility scripts for package management, networking, and media processing
- Security and performance optimizations for kernel and user space

## System Requirements

- Arch Linux (or derivatives).
- ZSH shell with Oh-My-ZSH framework.
- Sudo privileges for system-wide configurations.
- Common development tools (e.g., ffmpeg, Node.js with npm, make).

## Documentation

Each directory contains dedicated documentation:
- `configs/README.md`: System configuration details
- `fonts/README.md`: Font installation and usage
- `.zfunc/README.md`: ZSH function documentation
- `templates/README.md`: Template files documentation

## Notes
This is a personal configuration repository tailored to my specific needs and preferences. While you're welcome to use and adapt these configurations, please review them carefully before applying them to your system.
- **Backup First**: Always back up existing configurations before replacing them.
- **Path Guidance**: Each file includes a header comment indicating its target location.
- **Hardware Specificity**: Configurations target an Nvidia GPU, linux-zen kernel, and Btrfs filesystem, with optional Intel GPU support via `configs/20-intel.conf`.
- **Sudo Dependency**: Many utilities require sudo privileges for full functionality.

## License

MIT Licensed - See [LICENSE](LICENSE) for details.

--- 

⚡ Maintained by [@theEvilGrinch](https://github.com/theEvilGrinch)
