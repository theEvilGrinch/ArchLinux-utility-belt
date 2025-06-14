# Arch Linux Configuration Files

This directory contains configuration files for system components and applications tailored to an Arch Linux environment. These files are designed for my workflow but can be adapted to other setups with appropriate modifications.

## Table of Contents
- [Configuration Files](#configuration-files)
  - [Shell Configuration](#shell-configuration)
  - [Build Configuration](#build-configuration)
  - [NPM Configuration](#npm-configuration)
  - [System Configuration](#system-configuration)
  - [Boot Loader Configuration](#boot-loader-configuration)
  - [Custom Oh My ZSH Plugins](#custom-oh-my-zsh-plugins)
    - [Web Search Plugin](#web-search-plugin)
    - [Git Plugin](#git-plugin)
  - [Apache Configuration](#apache-configuration)
- [Notes](#notes)

## Configuration Files

### Shell Configuration
`.zshrc`: ZSH shell configuration with the following features:
  - Oh-My-ZSH framework with the "jonathan" theme
  - Comprehensive `PATH` setup for development tools
  - **Environment variables are externalized**:  
    - General environment variables (e.g., paths) are stored in `.env`
    - Sensitive or private variables (e.g., tokens, API keys) are stored in `.env_priv`
    - Both files are sourced at the start of `.zshrc` for environment initialization
  - System maintenance aliases (e.g., updates, cache cleanup)
  - Package management shortcuts for pacman and yay
  - Custom utilities for network testing, disk space checks, and file management
  - Advanced completion settings, improved history behavior, and enhanced key bindings

> **Note:**  
> `.env` and `.env_priv` files must exist in the configuration directory.  
> If you do not use these files, remove or comment out the corresponding lines in `.zshrc` to avoid errors:
```bash
  set -a
  source $HOME/.env
  source $HOME/.env_priv
  set +a
```

`.zshrc_default`: A default ZSH configuration with Oh-My-ZSH, provided as a baseline or fallback option.

### Build Configuration
`.makepkg.conf`: Optimized build settings for Arch Linux:
  - Compiler flags `-march=native` and `-mtune=native` for performance
  - Optimizations for C, C++, and Rust
  - Security features (`-fstack-clash-protection`, `-fcf-protection`)
  - Parallel compilation using all available CPU cores

### NPM Configuration
`.npmrc`: Global NPM settings:
  - Exact version saving for packages
  - Custom directory for global package installations

### System Configuration
`99-custom.conf`: Sysctl settings for security and responsiveness:
  - SYN flood protection and ICMP redirect prevention
  - Reduced swap usage and optimized disk write behavior
  - Address Space Layout Randomization (ASLR) and kernel pointer hiding
  - Network performance tweaks (e.g., TIME_WAIT socket reuse, fq_codel)  

`oomd.conf`: systemd-oomd configuration for out-of-memory management:
  - Limits swap usage and memory pressure
  - Customizes OOM handling thresholds and durations  

`20-intel.conf`: Xorg configuration for Intel integrated GPUs:
  - Enables DRI3 and SNA acceleration
  - Optional settings for tear-free rendering (commented by default)  

`mkinitcpio.conf`: Initramfs generation configuration:
  - Tailored for Nvidia GPU (modules: `nvidia`, `nvidia_modeset`, `nvidia_uvm`, `nvidia_drm`)
  - Optimized for the linux-zen kernel and Btrfs filesystem
  - Uses `lz4` compression (level `-6`) for fast boot times
  - `MODULES_DECOMPRESS="no"` to minimize early boot memory usage
  - **Note**: Adjust `MODULES` and `HOOKS` for your hardware and filesystem (e.g., Intel GPU, ext4, or encryption)

### Boot Loader Configuration
`grub`: GRUB boot loader configuration:
  - Custom kernel parameters for performance and hardware compatibility
  - Timeout and menu style settings
  - Custom theme and resolution
  - Disables recovery mode entries
  - Example settings for encrypted disks and OS probing
  - **Theme customization**: For a custom GRUB theme, you can install the `grub2-theme-archlinux` package from the AUR and set the path to the theme in the `GRUB_THEME` variable.

### Custom Oh My ZSH Plugins

#### Web Search Plugin
`web-search.plugin.zsh`: Custom Oh-My-ZSH plugin for terminal-based web searches:
  - Supports search engines (Google, DuckDuckGo, etc.), AI interfaces (ChatGPT, Perplexity), and Yandex Translate
  - Opens the default browser with the query

#### Git Plugin
`git.plugin.zsh`: Custom Oh-My-ZSH plugin for advanced Git workflows:
  - Extended aliases and functions for branch, commit, merge, and ref management
  - Simplified commands for pull/push, rebase, stash, log, and other operations
  - Automatic detection of the main branch (`main`, `master`, etc.)
  - Integration with autocompletion and support for user-defined scenarios

### Apache Configuration
`.htaccess`: Comprehensive Apache server configuration:
  - Security headers and rules (CSP, HSTS, X-Frame-Options)
  - Performance optimization through caching and compression
  - HTTPS and www/non-www redirects
  - MIME type definitions and file access controls
  - Customized error document handling

## Notes
These configurations are tailored to my workflow but can be adapted with care.
- **Backup First**: Always back up existing configurations before replacing them.
- **Path Guidance**: Each file includes a header comment indicating its target location.
- **Hardware Specificity**: Configurations target an Nvidia GPU, linux-zen kernel, and Btrfs filesystem, with optional Intel GPU support via `configs/20-intel.conf`.
- **Sudo Dependency**: Many utilities require sudo privileges for full functionality.
