# Templates Collection

![Templates](https://img.shields.io/badge/Templates-Ready_to_use-brightgreen?style=for-the-badge)

A curated collection of template files for various system configurations, documentation, and development workflows on Arch Linux.

## 📑 Overview

This directory contains standardized templates that streamline the creation of:
- System service units
- Desktop application entries
- Git commit messages
- Documentation files
- Office documents

## 🗂️ Available Templates

### System Configuration
- `desktop-file.desktop` - Template for creating desktop entries in accordance with the XDG Desktop Entry specification
- `example-system.service` - System-wide systemd service unit template with comprehensive comments
- `example-user.service` - User-level systemd service unit template with explanatory annotations

### Development Workflow
- `git-commit-template_ru.txt` - Structured git commit message template with Russian annotations
  - Enforces consistent commit message format
  - Includes type, scope, and description sections
  - Contains guidelines for writing clear commit messages
  - Can be set as default template: `git config --global commit.template PATH_TO_TEMPLATE`

### Documentation
- `new-article-for-sale.md` - Markdown template for creating marketplace listings
  - Predefined sections for title, category, and description
  - Structured layout for content organization
  - Built-in placeholders for essential metadata

### Office Documents
- `libreoffice.ott` - LibreOffice text document template
  - Pre-configured styles and formatting
  - Ready-to-use document structure
  - Consistent typography settings

## 🔧 Usage

1. Choose the appropriate template for your task
2. Copy the template to the required location
3. Fill in the placeholders with your specific content
4. Remove any unused sections or comments

### Example: Creating a System Service

```zsh
# Copy the system service template
sudo cp example-system.service /etc/systemd/system/myservice.service

# Edit the service file
sudo nano /etc/systemd/system/myservice.service

# Reload systemd
sudo systemctl daemon-reload
```