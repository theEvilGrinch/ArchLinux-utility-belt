# other

This directory contains IDE settings and themes for WebStorm, along with utility snapshots.

## 📋 Contents

- **`One_Dark_Webstorm_theme.icls`**: A dark theme for WebStorm, providing a comfortable coding experience with the One Dark color scheme.
- **`WebstormAllSettings_03.2025.zip`**: A backup archive of WebStorm settings, compatible with version 2024.3.2.1. Includes color schemes, editor settings, keymaps, plugins, project settings, and tools/terminal configurations.
- **`yay.tar.gz`**: A snapshot of the `yay` AUR helper utility for Arch Linux, archived for offline installation and version control.

## 📦 Installation
To use the theme, settings, and utilities:
1. **Theme Installation**:
   - Import `One_Dark_Webstorm_theme.icls` in WebStorm via `File > Settings > Editor > Color Scheme`.
   - Click the gear icon next to the scheme name and select `Import Scheme`.
   - Alternatively, place the file in:
     ```
     $HOME/.config/JetBrains/<WebStormVersion>/colors/
     ```
     Replace `<WebStormVersion>` with your IDE version (e.g., `WebStorm2024.3`).

2. **Settings Import**:
   - Extract and import `WebstormAllSettings_03.2025.zip` via `File > Manage IDE Settings > Import Settings`.

3. **yay Installation**:
   - Extract the snapshot and build the package:
     ```zsh
     tar -xzf yay.tar.gz
     cd yay
     makepkg -si --noconfirm
     ```

## ⚠️ Notes
- **Backup First**: Always back up existing WebStorm settings before replacing them.
- **Version Compatibility**: Settings are tested with WebStorm 2024.3.2.1; compatibility with other versions is not guaranteed.
- **yay Utility**: Requires `base-devel` and `git` packages to build. Intended for Arch Linux-based systems.