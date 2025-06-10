# ZSH Functions Library

A comprehensive collection of ZSH functions designed to streamline development workflows, automate routine tasks, and enhance productivity on Arch Linux systems.

## Table of Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Functions Reference](#functions-reference)
  - [Media Processing](#media-processing)
    - [fn_optimize_images](#fn_optimize_images)
    - [fn_youtube_video_translate](#fn_youtube_video_translate)
    - [fn_convert_media](#fn_convert_media)
    - [fn_convert_media_batch](#fn_convert_media_batch)
  - [Development Tools](#development-tools)
    - [fn_git_clone_template](#fn_git_clone_template)
  - [File Generators](#file-generators)
  - [Template Requirements](#template-requirements)

## Overview

This collection provides custom ZSH functions that automate common development and system administration tasks. Each function is designed to be modular, efficient, and easy to use with sensible defaults.

### Key Features
- **Media Processing**: Batch convert, optimize images, download and translate YouTube videos
- **Development Utilities**: Template-based project scaffolding, Git workflow enhancements
- **System Integration**: Generate systemd services, timers, and desktop entries
- **Smart Defaults**: All functions work with minimal configuration while supporting advanced options

## Dependencies

- `ZSH` (5.0+)
- [Oh-My-ZSH](https://github.com/ohmyzsh/ohmyzsh/) (optional but recommended)
- `nodejs` and `npm`
- `git` - version control (required for git-related functions)
- `ffmpeg` - media conversion and processing
- `yt-dlp` - YouTube video downloading
- `vot-cli` - video translation
- `pngquant` - PNG optimization
- `jpegoptim` - JPEG optimization
- `webp` - WebP support (for cwebp utility)
- `imagemagick` - AVIF support
- `svgo` - SVG optimization

## Installation

1.  **Create the `.zfunc` directory** in your home folder if it doesn't exist:
    ```bash
    mkdir -p ~/.zfunc
    ```
2.  **Place the function files** into `~/.zfunc`. You can either copy them or create symbolic links.

    **Option A: Copy Files**
    ```bash
    # Copy all functions from the cloned repository
    cp /path/to/ArchLinux-utility-belt/.zfunc/* ~/.zfunc/
    ```
    
    **Option B: Create Symbolic Links (Recommended)**
    This method keeps the functions updated with the repository.
    ```bash
    # Link all functions with a single command
    ln -s /path/to/ArchLinux-utility-belt/.zfunc/* ~/.zfunc/
    ```
    *Replace `/path/to/ArchLinux-utility-belt/` with the actual path to the cloned repository.*

3.  **Add the following lines** to your `.zshrc` file to enable autoloading:
    ```zsh
    # Add .zfunc directory to fpath
    fpath+=($HOME/.zfunc)

    # Autoload all functions in .zfunc
    autoload -Uz $HOME/.zfunc/*(:t)
    ```

4.  **Reload your ZSH configuration** to apply the changes:
    ```bash
    source ~/.zshrc
    ```
    or
    ```bash
    exec zsh
    ```
See [configs/.zshrc](../configs/.zshrc) for a complete configuration example.

## Functions Reference

### Media Processing

#### fn_optimize_images

Optimizes images in a source directory and saves the results to a target directory. Automatically selects the appropriate tool for each format: `pngquant` for PNG, `jpegoptim` for JPEG, `cwebp` for WEBP, `svgo` for SVG, and `magick` for AVIF.

**Usage:**  
```bash
  fn_optimize_images [input_folder] [output_folder]
```

**Arguments:**
- `input_folder` (optional): Source directory (default: current directory)
- `output_folder` (optional): Destination directory (default: current directory)

**Behavior:**
When both input and output folders point to the current directory, or when the specified output folder does not exist, a timestamped subfolder will be created automatically (format: img_DD-MM-YYYY_HH:MM:SS) to prevent overwriting original images.

**Dependencies:**
- `pngquant`
- `jpegoptim`
- `webp` (for `cwebp`)
- `imagemagick` (for `magick`)
- `svgo`
- `nodejs` and `npm` (for installing `svgo` via `npm install -g svgo`)

**Supported formats:** png, jpg, jpeg, webp, svg, avif.

**Example:**
```bash
fn_optimize_images ~/pictures/raw ~/pictures/optimized
```

#### fn_youtube_video_translate

Downloads a YouTube video, translates its audio track to Russian using `vot-cli` and Yandex API, and merges the translated audio with the original video using `ffmpeg`. Uses Firefox cookies for `yt-dlp` by default - adjust or remove `--cookies-from-browser firefox` if you use a different browser. The `--concurrent-fragments 24` option in `yt-dlp` enables parallel downloads; reduce this value on low-performance systems.

**Usage:**  
```bash
  fn_youtube_video_translate project_name video_url
```

**Arguments:**
- `project_name` (required): Name for the project folder and output files
- `video_url` (required): YouTube video URL

**Behavior:**
1. Creates project directory: `~/videos/translate/src/<project_name>/`
2. Uses `vot-cli` to extract and translate audio to MP3 format
3. Downloads video using `yt-dlp` with best quality MP4 format
4. Merges original video with translated audio using `ffmpeg`
5. Outputs final video as: `~/videos/translate/<project_name>_final.mp4`
6. Warns if project directory already exists and asks for confirmation
7. Automatically cleans up temporary files if process fails

**Dependencies:**
- `vot-cli` - for audio extraction and translation
- `yt-dlp` - for video downloading
- `ffmpeg` - for video/audio merging

**Note:** Requires hardware acceleration support for optimal performance. The function uses `--hwaccel auto` to automatically detect available acceleration.

#### fn_convert_media

Converts a single audio or video file to a different format.

**Usage:**
```bash
  fn_convert_media input_file output_extension [ffmpeg_options]
```
**Dependencies:** `ffmpeg`

**Supported formats:**
- Audio: mp3, aac, m4a, flac, wav, ogg, opus
- Video: mp4, mkv, avi, mov, webm, flv, wmv

**Arguments:**
- `input_file` (required): Path to source file
- `output_extension` (required): Target format (e.g., mp4, mkv, mp3)
- `ffmpeg_options` (optional): Additional FFmpeg parameters

**Examples:**
```bash
fn_convert_media video.mp4 mkv
fn_convert_media audio.wav mp3 -b:a 320k
# Conversion with custom ffmpeg options for hardware acceleration
fn_convert_media video.mp4 mkv -c:v h264_nvenc -c:a copy
```

#### fn_convert_media_batch

Batch converts all media files in a directory to a specified format.

**Usage:**
```bash
  fn_convert_media_batch input_folder output_folder output_extension [ffmpeg_options]
```

**Arguments:**
- `input_folder` (required): Source directory
- `output_folder` (required): Destination directory
- `output_extension` (required): Target format
- `ffmpeg_options` (optional): Additional FFmpeg parameters

**Dependencies:** `ffmpeg`

**Supported Formats:**
- Audio: mp3, aac, m4a, flac, wav, ogg, opus
- Video: mp4, mkv, avi, mov, webm, flv, wmv

**Example:**
```bash
fn_convert_media_batch . . wav
fn_convert_media_batch ~/videos/raw ~/videos/converted mkv "-c:v libx265"
```

### Development Tools

#### fn_git_clone_template

Clones a repository as a template, removing Git history and reinitializing.

**Usage:**
```bash
fn_git_clone_template repo_url [branch] [project_name]
```

**Arguments:**
- `repo_url` (required): Git repository URL (HTTPS or SSH)
- `branch` (optional): Source branch (default: master)
- `project_name` (optional): New project directory name

**Dependencies:** `git`

**Behavior:**
- If source-branch is omitted, master is used.
- If new-project-name is omitted, files are copied into the current working directory.
- The original .git directory is removed. A new Git repository is initialized.

**Examples:**
```bash
fn_git_clone_template https://github.com/user/template.git
fn_git_clone_template git@github.com:user/template.git main my-project
```

### File Generators

This group of functions, prefixed with `fn_new_`, generates configuration and project files from templates.

**Common Usage Pattern:** `function_name [name] [path]`
  - `name`: The base name for the file (e.g., `my-app`). The file extension is added automatically.
  - `path`: The target directory (defaults to the current directory).


| Function                 | Description                                     | Usage Example                        |
|--------------------------|-------------------------------------------------|--------------------------------------|
| `fn_new_Dockerfile`      | Creates a `Dockerfile`.                         | `fn_new_Dockerfile ./project`        |
| `fn_new_dockerignore`    | Creates a `.dockerignore` file.                 | `fn_new_dockerignore ./project`      |
| `fn_new_docker_compose`  | Creates a `docker-compose.yaml` file.           | `fn_new_docker_compose ./project`    |
| `fn_new_gitignore`       | Creates a `.gitignore` file.                    | `fn_new_gitignore ./project`         |
| `fn_new_desktop_file`    | Creates a `.desktop` entry.                     | `fn_new_desktop_file my-app`         |
| `fn_new_timer`           | Creates a systemd `.timer` unit.                | `fn_new_timer my-task`               |
| `fn_new_system_service`  | Creates a system-level systemd `.service` unit. | `fn_new_system_service my-daemon`    |
| `fn_new_user_service`    | Creates a user-level systemd `.service` unit.   | `fn_new_user_service my-agent`       |
| `fn_new_libreoffice_doc` | Creates a LibreOffice document (`.odt`).        | `fn_new_libreoffice_doc "My Report"` |

### Template Requirements

All `fn_new_*` functions require corresponding template files in the `~/templates` directory. Example templates are provided in the [`templates`](../templates) directory of this repository.

To use these functions:
1. Copy or create symbolic links from the [templates](../templates) folder of the cloned repository to your local `~/templates/` directory.
2. Customize templates as needed, functions will use your customized versions

For additional help, please refer to the main [README](../README.md) or [open an issue](https://github.com/theEvilGrinch/ArchLinux-utility-belt/issues).
