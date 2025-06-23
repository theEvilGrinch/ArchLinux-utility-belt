# File Generation Templates

A comprehensive collection of template files for system configurations and development workflows on Arch Linux.

## Table of Contents
- [System Configuration](#system-configuration)
- [Development Workflow](#development-workflow)
  - [Git](#git)
  - [Docker](#docker)
  - [Code Formatting](#code-formatting)
- [Office Documents](#office-documents)
- [Automation](#automation)

## System Configuration
- `desktop-file.desktop` - Template for creating desktop entries in accordance with the XDG Desktop Entry specification
- `example-system.service` - System-wide systemd service unit template with comprehensive comments
- `example-user.service` - User-level systemd service unit template with explanatory annotations
- `example-timer.timer` - Systemd timer unit template with scheduling examples and best practices

## Development Workflow
### Git
`.gitignore` - Comprehensive Git ignore template for development projects
- Excludes common development artifacts and temporary files
- Covers major IDEs and editors (VS Code, JetBrains, Sublime, Zed, Vim, Emacs)
- Includes specific rules for Node.js, React, React Native, Angular, Go, and more
- Handles OS-specific files (macOS, Linux, Windows)

`git-commit-template_en.txt` - Structured git commit message template with English annotations
- Enforces consistent commit message format
- Includes type, scope, and description sections
- Contains guidelines for writing clear commit messages
- Can be set as default template: `git config --global commit.template "$HOME/templates/git-commit-template_en.txt"`

`git-commit-template_ru.txt` - Structured git commit message template with Russian annotations
- Same structure and features as English version
- Includes Russian comments and guidelines
- Can be set as default template: `git config --global commit.template "$HOME/templates/git-commit-template_ru.txt"`

### Docker
`Dockerfile` - Template for Node.js applications using Alpine Linux
- Minimal base image for reduced size
- Standard Node.js project structure
- Basic npm workflow configuration

`docker-compose.yaml` - Template for multi-container Docker applications  
- Defines isolated services 
- Maps host ports to container ports for local development
- Mounts project directories as volumes for live code updates
- Includes persistent `node_modules` volume to avoid conflicts with host dependencies
- Configured for interactive frontend development

`.dockerignore` - Docker ignore template
- Excludes development dependencies and build artifacts
- Prevents unnecessary files from being copied to images
- Optimized for Node.js projects and common development tools

### Code Formatting
`.editorconfig` - EditorConfig template for consistent code formatting
- Defines coding styles that work across different editors and IDEs
- Standardizes indentation, line endings, and character encoding
- Includes special rules for Markdown files
- Ensures consistent formatting across development teams

## Office Documents
`libreoffice.ott` - LibreOffice text document template
- Pre-configured styles and formatting
- Ready-to-use document structure
- Consistent typography settings

## Automation

Template-based file generation is automated through Zsh functions available in the [`.zfunc`](../.zfunc) directory. These functions streamline creating new files from the templates in this repository.
