# Custom ZSH Functions

This directory contains ZSH functions that provide additional functionality and automation for various tasks.

# Table of Contents

- [Functions](#functions)
  - [fn_youtube_video_translate](#fn_youtube_video_translate)
  - [fn_optimize_images](#fn_optimize_images)
  - [fn_convert_media](#fn_convert_media)
  - [fn_convert_media_batch](#fn_convert_media_batch)
  - [fn_git_clone_template](#fn_git_clone_template)
  - [fn_new_Dockerfile](#fn_new_dockerfile)
  - [fn_new_dockerignore](#fn_new_dockerignore)
  - [fn_new_docker_compose](#fn_new_docker_compose)
  - [fn_new_gitignore](#fn_new_gitignore)
  - [fn_new_desktop_file](#fn_new_desktop_file)
  - [fn_new_timer](#fn_new_timer)
  - [fn_new_system_service](#fn_new_system_service)
  - [fn_new_user_service](#fn_new_user_service)
  - [fn_new_libreoffice_doc](#fn_new_libreoffice_doc)
- [Setup](#setup)

## Functions

All functions prefixed with `fn_new*` require the presence of corresponding template files in the ~/templates directory. Example templates are provided in the [templates](../templates) directory of this repository. Ensure these files are available on your system for the functions to work correctly.

### fn_youtube_video_translate
Downloads a YouTube video, translates its audio track to Russian using `vot-cli` and Yandex API, and merges the translated audio with the original video using `ffmpeg`. Uses Firefox cookies for `yt-dlp` by default - adjust or remove `--cookies-from-browser firefox` if you use a different browser. The `--concurrent-fragments 24` option in `yt-dlp` enables parallel downloads; reduce this value on low-performance systems.

**Usage:**  
`fn_youtube_video_translate project_name video_url`

**Arguments:**
- `project_name`: Required. Name of the project folder and files to be created
- `video_url`:    Required. URL of the YouTube video to download and translate

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

---

### fn_optimize_images
Optimizes images in a source directory and saves the results to a target directory. Automatically selects the appropriate tool for each format: `pngquant` for PNG, `jpegoptim` for JPEG, `cwebp` for WEBP, `svgo` for SVG, and `magick` for AVIF.

**Usage:**  
`fn_optimize_images [input_folder] [output_folder]`

**Arguments:**
- `input_folder`:  Optional. Path to input folder (default: current working directory).
- `output_folder`: Optional. Path to output folder (default: current working directory).

**Behavior:**
When both input and output folders point to the current directory, or when the specified output folder does not exist, a timestamped subfolder will be created automatically (format: img_DD-MM-YYYY_HH:MM:SS) to prevent overwriting original images.

**Dependencies:**
- `pngquant`
- `jpegoptim`
- `webp` (for `cwebp`)
- `imagemagick` (for `magick`)
- `svgo`
- `nodejs` and `npm` (for installing `svgo` via `npm install -g svgo`)

---

### fn_convert_media
Converts audio or video files to a specified format using FFmpeg. Validates input file existence, checks FFmpeg format support.

**Usage:**  
`fn_convert_media input_file output_extension [ffmpeg_options]`

**Arguments:**
- `input_file`: Required. Path to the input media file.
- `output_extension`: Required. Desired output file extension (e.g., mkv, mp3, aac).
- `ffmpeg_options`: Optional. Additional FFmpeg options.

**Examples:**
```bash
fn_convert_media ~/audiofolder/audiofile.mp3 aac
fn_convert_media ~/videofolder/videofile.mp4 mkv -c:v h264_nvenc -c:a copy
````
---

### fn_convert_media_batch
Batch converts all audio or video files in a directory to a specified format using FFmpeg. Validates input/output folders, checks format support, and processes each file individually.

**Usage:**  
`fn_convert_media_batch input_folder output_folder output_extension [ffmpeg_options]`

**Arguments:**
- input_folder: Required. Path to the folder containing input media files.
- output_folder: Required. Path to the folder where converted files will be saved.
- output_extension: Required. Desired output file extension (e.g., mkv, mp3, aac).
- ffmpeg_options: Optional. Additional FFmpeg options.

**Examples:**
```bash
fn_convert_media_batch ~/audiofolder ~/converted aac
fn_convert_media_batch ~/videofolder ~/converted mkv -c:v h264_nvenc -c:a copy
```

**Supported formats for `fn_convert_media_batch` and `fn_convert_media`:**  
Audio: `mp3`, `aac`, `m4a`, `flac`, `wav`, `ogg`, `opus`  
Video: `mp4`, `mkv`, `avi`, `mov`, `webm`, `flv`, `wmv`

---

### fn_git_clone_template
Clones a Git repository as a template, removing its history and initializing a new repository. Supports specifying a branch and a new project directory.

**Usage:**  
`fn_git_clone_template git-repo-url [source-branch] [new-project-name]`

**Arguments:**
- `git-repo-url`: Required. The URL of the Git repository (HTTPS or SSH).
- `source-branch`: Optional. Branch to copy from (default: `master`).
- `new-project-name`: Optional. Name for the new project directory.

**Behavior:**
- If `source-branch` is omitted, uses `master`.
- If `new-project-name` is omitted, copies files into the current directory.
- If `new-project-name` is specified, creates a new directory and copies files into it.
- The original `.git` directory is removed; a new Git repository is initialized.

**Examples:**
```bash
fn_git_clone_template https://github.com/user/repo.git
fn_git_clone_template git@github.com:user/repo.git main new-project
fn_git_clone_template https://github.com/user/repo.git develop my-project
```

---

### fn_new_Dockerfile
Creates a new `Dockerfile` from a template in the specified directory (default: current directory).

**Usage:**  
`fn_new_Dockerfile [path]`

---

### fn_new_dockerignore
Creates a new `.dockerignore` file from a template in the specified directory (default: current directory).

**Usage:**  
`fn_new_dockerignore [path]`

---

### fn_new_docker_compose
Creates a new `docker-compose.yaml` file from a template in the specified directory (default: current directory).

**Usage:**  
`fn_new_docker_compose [path]`

---

### fn_new_gitignore
Creates a new `.gitignore` file from a template in the specified directory (default: current directory).

**Usage:**  
`fn_new_gitignore [path]`

---

### fn_new_desktop_file
Creates a new `.desktop` file from a template. Allows specifying the filename and target directory.

**Usage:**  
`fn_new_desktop_file [filename] [path]`

**Arguments:**
- `filename`: Optional. Name of the `.desktop` file, without extension (default: `desktop-file.desktop`).
- `path`: Optional. Path where the file will be created (default: current directory).

---

### fn_new_timer
Creates a new systemd timer unit file from a template. Allows specifying the unit name and target directory.

**Usage:**  
`fn_new_timer unit_name [path]`

**Arguments:**
- `unit_name`: Required. Name for the timer unit file, without extension.
- `path`: Optional. Path where the file will be created (default: current directory).

---

### fn_new_system_service
Creates a new system-level systemd service unit file from a template. Allows specifying the unit name and target directory.

**Usage:**  
`fn_new_system_service unit_name [path]`

**Arguments:**
- `unit_name`: Required. Name for the service unit file, without extension.
- `path`: Optional. Path where the file will be created (default: current directory).

---

### fn_new_user_service
Creates a new user-level systemd service unit file from a template. Allows specifying the unit name and target directory.

**Usage:**  
`fn_new_user_service unit_name [path]`

**Arguments:**
- `unit_name`: Required. Name for the service unit file, without extension.
- `path`: Optional. Path where the file will be created (default: current directory).

---

### fn_new_libreoffice_doc
Creates a new LibreOffice document from a template. Allows specifying the document name and target directory.

**Usage:**  
`fn_new_libreoffice_doc document_name [path]`

**Arguments:**
- `document_name`: Required. Name for the document, without extension.
- `path`: Optional. Path where the file will be created (default: current directory).


## Setup
To use the functions in the `.zfunc` directory, add it to your ZSH `fpath` and enable autoloading in your `.zshrc`. This ensures ZSH can locate and load the functions automatically.

**Example**:
```zsh
fpath+=($HOME/.zfunc)
for file in $HOME/.zfunc/*; do
  autoload -Uz ${file:t}
done
```
See [configs/.zshrc](../configs/.zshrc) for full configuration details.