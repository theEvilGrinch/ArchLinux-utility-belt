# Custom ZSH Functions

This directory contains ZSH functions that provide additional functionality and automation for various tasks.

## Functions

### `fn_youtube_video_translate`
Automatically translates YouTube videos into Russian. Utilizes `vot-cli` with the Yandex API to translate audio, downloads video using `yt-dlp`, and merges them with `ffmpeg` to produce a new video with a translated audio track. Requires an Nvidia GPU for `-hwaccel cuda` in `ffmpeg`; remove this option if unavailable. Uses Firefox cookies via `yt-dlp` (`--cookies-from-browser firefox`); adjust as needed for your browser. The `--concurrent-fragments 24` option in `yt-dlp` enables parallel downloads; reduce this value on low-performance systems.

**Usage:**  
`fn_youtube_video_translate <project_name> <video_url>`

---

### `fn_optimize_images`
Optimizes images in a source directory and saves the results to a target directory. Applies the appropriate optimization tool based on file format:

- PNG: `pngquant`
- JPEG: `jpegoptim`
- WEBP: `cwebp` (from the `libwebp` package)
- SVG: `svgo`
- AVIF: `magick` (from the `imagemagick` package)

**Usage:**  
`fn_optimize_images <source_folder> <target_folder>`

---

### `fn_convert_media`
Converts audio or video files to a specified format using FFmpeg. Validates input file existence, checks FFmpeg format support, and generates the output filename by replacing the input extension.

**Usage:**  
`fn_convert_media <input_file> <output_extension> "<ffmpeg_options>"`

**Examples:**
- `fn_convert_media ~/audiofolder/audiofile.mp3 aac`
- `fn_convert_media ~/videofolder/videofile.mp4 mkv "-c:v h264_nvenc -c:a copy"`

---

### `fn_convert_media_batch`
Batch converts audio or video files from an input folder to a specified format using FFmpeg. Validates input folder, creates output folder if needed, and processes all files in the input directory.

**Usage:**  
`fn_convert_media_batch <input_folder> <output_folder> <output_extension> "<ffmpeg_options>"`

**Examples:**
- `fn_convert_media_batch ~/audiofolder ~/converted aac`
- `fn_convert_media_batch ~/videofolder ~/converted mkv "-c:v h264_nvenc -c:a copy"`

**Supported formats:**  
Audio: `mp3`, `aac`, `m4a`, `flac`, `wav`, `ogg`, `opus`  
Video: `mp4`, `mkv`, `avi`, `mov`, `webm`, `flv`, `wmv`

---

### `fn_git_clone_template`
Clones a Git repository as a template without preserving Git history. Copies files from a specific branch into the current directory or a new project directory, removes the original `.git` directory, and initializes a new Git repository.

**Usage:**  
`fn_git_clone_template <git-repo-url> [source-branch] [new-project-name]`

**Arguments:**
- `<git-repo-url>`: Required. The URL of the Git repository (HTTPS or SSH).
- `[source-branch]`: Optional. Branch to copy from (default: `master`).
- `[new-project-name]`: Optional. Name for the new project directory.

**Behavior:**
- If `[source-branch]` is omitted, uses `master`.
- If `[new-project-name]` is omitted, copies files into the current directory.
- If `[new-project-name]` is specified, creates a new directory and copies files into it.
- The original `.git` directory is removed; a new Git repository is initialized.

**Examples:**
- `fn_git_clone_template https://github.com/user/repo.git`
- `fn_git_clone_template git@github.com:user/repo.git main new-project`
- `fn_git_clone_template https://github.com/user/repo.git develop my-project`

---

### `fn_new_Dockerfile`
Creates a new Dockerfile from a template.

**Usage:**  
`fn_new_Dockerfile [path]`

**Arguments:**
- `path`: Optional. Path where the file will be created (default: current directory).

---

### `fn_new_desktop_file`
Creates a new `.desktop` file from a template.

**Usage:**  
`fn_new_desktop_file [filename] [path]`

**Arguments:**
- `filename`: Optional. Name of the `.desktop` file, without extension (default: `desktop-file.desktop`).
- `path`: Optional. Path where the file will be created (default: current directory).

---

### `fn_new_timer`
Creates a new systemd timer unit from a template.

**Usage:**  
`fn_new_timer [unit_name] [path]`

**Arguments:**
- `unit_name`: Required. Name for the timer unit file, without extension.
- `path`: Optional. Path where the file will be created (default: current directory).

---

### `fn_new_system_service`
Creates a new system-level systemd service unit from a template.

**Usage:**  
`fn_new_system_service [unit_name] [path]`

**Arguments:**
- `unit_name`: Required. Name for the service unit file, without extension.
- `path`: Optional. Path where the file will be created (default: current directory).

---

### `fn_new_user_service`
Creates a new user-level systemd service unit from a template.

**Usage:**  
`fn_new_user_service [unit_name] [path]`

**Arguments:**
- `unit_name`: Required. Name for the service unit file, without extension.
- `path`: Optional. Path where the file will be created (default: current directory).

---

### `fn_new_libreoffice_doc`
Creates a new LibreOffice document from a template.

**Usage:**  
`fn_new_libreoffice_doc [document_name] [path]`

**Arguments:**
- `document_name`: Required. Name for the document, without extension.
- `path`: Optional. Path where the file will be created (default: current directory).


## Setup
To use the functions in the `.zfunc` directory, add it to your ZSH `fpath` and enable auto loading in your `.zshrc`. This ensures ZSH can locate and load the functions automatically.

**Example**:
```zsh
fpath+=($HOME/.zfunc)
for file in $HOME/.zfunc/*; do
  autoload -Uz ${file:t}
done
```
See [configs/.zshrc](../configs/.zshrc) for full configuration details.

## Notes
These configurations are tailored to my workflow but can be adapted with care.<br>
- **Backup First**: Always back up existing configurations before replacing them.<br>
- **Path Guidance**: Each file includes header comment indicating its target location.