# File Generation Templates

![Templates](https://img.shields.io/badge/Templates-Ready_to_use-brightgreen?style=for-the-badge)

A comprehensive collection of template files for system configurations and development workflows on Arch Linux.

## Table of Contents
- [System Configuration](#system-configuration)
- [Development Workflow](#development-workflow)
- [Docker Configuration](#docker-configuration)
- [Office Documents](#office-documents)
- [Automation](#automation)

## System Configuration
- `desktop-file.desktop` - Template for creating desktop entries in accordance with the XDG Desktop Entry specification
- `example-system.service` - System-wide systemd service unit template with comprehensive comments
- `example-user.service` - User-level systemd service unit template with explanatory annotations
- `example-timer.timer` - Systemd timer unit template with scheduling examples and best practices

## Development Workflow
`git-commit-template_en.txt` - Structured git commit message template with English annotations
- Enforces consistent commit message format
- Includes type, scope, and description sections
- Contains guidelines for writing clear commit messages
- Can be set as default template: `git config --global commit.template "$HOME/templates/git-commit-template_en.txt"`

`git-commit-template_ru.txt` - Structured git commit message template with Russian annotations
- Same structure and features as English version
- Includes Russian comments and guidelines
- Can be set as default template: `git config --global commit.template "$HOME/templates/git-commit-template_ru.txt"`

## Docker Configuration
`Dockerfile` - Template for Node.js applications using Alpine Linux
- Minimal base image for reduced size
- Standard Node.js project structure
- Basic npm workflow configuration

## Office Documents
`libreoffice.ott` - LibreOffice text document template
- Pre-configured styles and formatting
- Ready-to-use document structure
- Consistent typography settings

## Automation

Template-based file generation is automated through Zsh functions available in the [`.zfunc`](../.zfunc) directory. These functions streamline creating new files from the templates in this repository.