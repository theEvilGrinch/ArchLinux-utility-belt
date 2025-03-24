# fonts

This directory contains a collection of TrueType Fonts (TTF) for use in an Arch Linux environment, such as FiraCode, MartianMono, and OpenSans.

## Installation
Place the `fonts/` directory in `$HOME/.fonts/` to make the fonts available for your user. Alternatively, you can use the following locations:
- **User-level**: `$HOME/.local/share/fonts/` (modern standard for user fonts)
- **System-level**: `/usr/share/fonts/` or `/usr/local/share/fonts/` (requires sudo, makes fonts available to all users)

## ⚙️ Setup
After copying the fonts to your desired location, update the font cache to make them available to your system.
Update the font cache using the following commands to ensure the fonts are recognized by your system:
```zsh
sudo fc-cache -fv && fc-cache -f -v
```
- `sudo fc-cache -fv` updates the system-wide font cache (requires sudo).
- `fc-cache -f -v` updates the user-level font cache.

## ⚠️ Notes
- **Backup First**: Always back up existing font directories before replacing them. 
- **Sudo Dependency**: Updating the system-wide font cache requires sudo privileges.