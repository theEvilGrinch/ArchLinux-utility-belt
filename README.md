# ArchLinux Utility Belt

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)

A personal collection of configuration files, utilities, scripts, and functions for managing and enhancing Arch Linux system.

## 🎯 Overview

This repository serves as my personal toolkit for Arch Linux system administration and customization. It contains various configuration files, shell scripts, and utilities that I use to streamline my workflow and system management tasks.

## 📂 Repository Structure
The repository is organized as follows:
```
ArchLinux-utility-belt/
├── configs/                   # System and application configurations
│   ├── 20-intel.conf          # Xorg Intel GPU configuration
│   ├── 99-custom.conf         # Kernel parameters optimization
│   ├── .makepkg.conf          # Build system configuration
│   ├── .npmrc                 # NPM global settings
│   ├── .zshrc                 # Main ZSH configuration
│   ├── .zshrc_default         # Default Oh-My-ZSH config
│   ├── mkinitcpio.conf        # Initramfs generation (Nvidia/Btrfs)
│   ├── web-search.plugin.zsh  # Terminal search plugin
│   └── web-search.plugin.zsh_default  # Default web-search plugin
├── fonts/                     # Font collections (TTF)
│   └── [various font files]   # FiraCode, MartianMono, OpenSans, etc.
├── .zfunc/                    # Custom ZSH functions
│   ├── fn_youtube_video_translate  # Video translation workflow
│   └── fn_new_article_for_sale     # Create new custom article file
├── other/                     # IDE themes and settings
│   ├── One_Dark_Webstorm_theme.icls
│   └── WebstormAllSettings_03.2025.zip
├── LICENSE                    # MIT License
└── README.md                  # Main documentation
```

## ⚙️ System Requirements

- Arch Linux (or derivatives).
- ZSH shell with Oh-My-ZSH framework.
- Sudo privileges for system-wide configurations.
- Common development tools (e.g., ffmpeg, Node.js with npm, make).

## 📚 Documentation

Each directory contains dedicated documentation:
- `configs/README.md`: System configuration details
- `fonts/README.md`: Font installation and usage
- `.zfunc/README.md`: ZSH function documentation
- `other/README.md`: IDE settings and themes

## ⚠️ Notes
This is a personal configuration repository tailored to my specific needs and preferences. While you're welcome to use and adapt these configurations, please review them carefully before applying them to your system.
- **Backup First**: Always back up existing configurations before replacing them.
- **Path Guidance**: Each file includes a header comment indicating its target location.
- **Hardware Specificity**: Configurations target an Nvidia GPU, linux-zen kernel, and Btrfs filesystem, with optional Intel GPU support via `configs/20-intel.conf`.
- **Sudo Dependency**: Many utilities require sudo privileges for full functionality.

## 📄 License

MIT Licensed - See [LICENSE](LICENSE) for details.

---

⚡ Maintained by [@theEvilGrinch](https://github.com/theEvilGrinch)