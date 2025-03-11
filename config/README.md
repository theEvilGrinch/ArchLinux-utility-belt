# Configuration Files

## Shell Configuration
- `.zshrc` - ZSH shell configuration with the following features:
  - Oh-My-ZSH setup with "jonathan" theme
  - Comprehensive PATH configuration
  - Environment variables setup (Java, Go, NVM, etc.)
  - System maintenance aliases
  - Package management shortcuts (pacman/yay)
  - Development tools configuration (NPM, Node.js)
  - Custom utility aliases
  - Advanced ZSH completion settings
  - Improved command history behavior
  - Enhanced key bindings for better usability

## Build Configuration
- `.makepkg.conf` - Optimized build configuration for Arch Linux:
  - Uses `-march=native` and `-mtune=native` for better performance
  - Optimizations for C, C++, and Rust
  - Security enhancements including `-fstack-clash-protection` and `-fcf-protection`
  - Auto-detection of available CPU cores for parallel compilation
  - Placed in `~/.makepkg.conf` to allow user-specific customization

## NPM Configuration
- `.npmrc` - NPM global configuration:
  - Saves exact package versions
  - Sets custom global packages location

## ⚒️ Installation

### Shell Configuration
```bash
# Backup your existing configuration
cp ~/.zshrc ~/.zshrc.backup

# Create symbolic link
ln -s /path/to/repo/config/.zshrc ~/.zshrc

# Reload shell configuration
source ~/.zshrc
```

### Build Configuration
```bash
# Backup existing configuration
cp ~/.makepkg.conf ~/.makepkg.conf.backup

# Copy new configuration
cp /path/to/repo/config/.makepkg.conf ~/.makepkg.conf
```

### NPM Configuration
```bash
# Backup existing configuration if any
cp ~/.npmrc ~/.npmrc.backup

# Create symbolic link
ln -s /path/to/repo/config/.npmrc ~/.npmrc
```

## 🛠 Prerequisites

The configurations and scripts assume you have the following software installed:
- Arch Linux
- ZSH shell
- Oh-My-ZSH
- yay (AUR helper)
- Various development tools (Node.js, Java, Go)
- Midnight Commander (mc)
- input-remapper

## 🗉 Feature Highlights

### System Maintenance
- Mirror list update utility
- Package cache cleanup
- System update shortcuts
- Orphaned packages removal

### Package Management
- Simplified pacman/yay commands
- Package installation/removal aliases
- AUR interaction shortcuts

### Development Tools
- NPM package management aliases
- NVM (Node Version Manager) integration
- Java and Go environment setup
- Global PATH configuration

### Custom Utilities
- Network testing command
- Disk space checking
- Input remapper controls
- File management shortcuts

## ⚙️ Customization

Most configurations can be modified by editing the respective files:
- Shell aliases: Edit `.zshrc` and add/modify aliases
- Environment variables: Adjust paths in `.zshrc`
- Theme settings: Change `ZSH_THEME` in `.zshrc`
- Build flags: Adjust optimization settings in `.makepkg.conf`

## 🚀 Usage Examples

### System Updates
```bash
# Full system update (including mirrors)
update_os

# Quick force update with no confirmations
update_os_fast_and_force

# Update and reboot
update_os_and_reboot
```

### Package Management
```bash
# Install package from official repos
pms package-name

# Install package from AUR
ys package-name

# Remove package
pmr package-name
```

### Development
```bash
# Install global NPM package
nig package-name

# Clean NPM cache
cleancache_npm
```

## 📝 Notes

- All configurations are personally tailored for my workflow but can be easily adapted
- Some aliases assume specific software is installed
- Regular maintenance commands are simplified through aliases
- Backup your existing configurations before using these

## 📄 License

This project is licensed under the MIT License.

---

⚡️ Maintained by [@theEvilGrinch](https://github.com/theEvilGrinch)