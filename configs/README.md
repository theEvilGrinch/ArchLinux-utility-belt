# Configs

This directory contains configuration files for system components and applications tailored to an Arch Linux environment. These files are designed for my workflow but can be adapted to other setups with appropriate modifications.

## Configuration Files

### Shell Configuration
- **`.zshrc`**: ZSH shell configuration with the following features:
  - Oh-My-ZSH framework with the "jonathan" theme
  - Comprehensive PATH setup for development tools
  - Environment variables for Java, Go, Node.js (via NVM), and more
  - System maintenance aliases (e.g., updates, cache cleanup)
  - Package management shortcuts for pacman and yay
  - Custom utilities for network testing, disk space checks, and file management
  - Advanced completion settings, improved history behavior, and enhanced key bindings

- **`.zshrc_default`**: A default ZSH configuration with Oh-My-ZSH, provided as a baseline or fallback option.

### Build Configuration
- **`.makepkg.conf`**: Optimized build settings for Arch Linux:
  - Compiler flags `-march=native` and `-mtune=native` for performance
  - Optimizations for C, C++, and Rust
  - Security features (`-fstack-clash-protection`, `-fcf-protection`)
  - Parallel compilation using all available CPU cores

### NPM Configuration
- **`.npmrc`**: Global NPM settings:
  - Exact version saving for packages
  - Custom directory for global package installations

### System Configuration
- **`99-custom.conf`**: Sysctl settings for security and responsiveness:
  - SYN flood protection and ICMP redirect prevention
  - Reduced swap usage and optimized disk write behavior
  - Address Space Layout Randomization (ASLR) and kernel pointer hiding
  - Network performance tweaks (e.g., TIME_WAIT socket reuse, fq_codel)

- **`20-intel.conf`**: Xorg configuration for Intel integrated GPUs:
  - Enables DRI3 and SNA acceleration
  - Optional settings for tear-free rendering (commented by default)

- **`mkinitcpio.conf`**: Initramfs generation configuration:
  - Tailored for Nvidia GPU (modules: `nvidia`, `nvidia_modeset`, `nvidia_uvm`, `nvidia_drm`)
  - Optimized for the linux-zen kernel and Btrfs filesystem
  - Uses `lz4` compression (level `-6`) for fast boot times
  - `MODULES_DECOMPRESS="no"` to minimize early boot memory usage
  - **Note**: Adjust `MODULES` and `HOOKS` for your hardware and filesystem (e.g., Intel GPU, ext4, or encryption)

### Web Search Plugin
- **`web-search.plugin.zsh`**: Custom Oh-My-ZSH plugin for terminal-based web searches:
  - Supports search engines (Google, DuckDuckGo, etc.), AI interfaces (ChatGPT, Perplexity), and Yandex Translate
  - Opens the default browser with the query
- **`web-search.plugin.zsh_default`**: Default version of the web search plugin for reference or alternative use.

### Apache Configuration
- **`.htaccess`**: Comprehensive Apache server configuration:
  - Security headers and rules (CSP, HSTS, X-Frame-Options)
  - Performance optimization through caching and compression
  - HTTPS and www/non-www redirects
  - MIME type definitions and file access controls
  - Customized error document handling

## 🛠 Prerequisites
- Arch Linux (or derivatives)
- ZSH shell with Oh-My-ZSH
- Sudo privileges for system-wide changes
- Common development tools (e.g., ffmpeg, Node.js with npm, make)
- Optional: yay (AUR helper), Nvidia drivers, linux-zen kernel

## ⚠️ Notes
These configurations are tailored to my workflow but can be adapted with care.
- **Backup First**: Always back up existing configurations before replacing them.
- **Path Guidance**: Each file includes a header comment indicating its target location.
- **Hardware Specificity**: Configurations target an Nvidia GPU, linux-zen kernel, and Btrfs filesystem, with optional Intel GPU support via `configs/20-intel.conf`.
- **Sudo Dependency**: Many utilities require sudo privileges for full functionality.

## 📄 License
Licensed under the MIT License. See the root [LICENSE](../LICENSE) file for details.

---
Maintained by [@theEvilGrinch](https://github.com/theEvilGrinch)