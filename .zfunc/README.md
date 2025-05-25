# .zfunc

This directory contains ZSH functions that provide additional functionality and automation for various tasks.

## Functions

- **fn_youtube_video_translate**: automatically translates YouTube videos into Russian. It uses `vot-cli` with Yandex API to translate audio into Russian, downloads video using `yt-dlp`, and combines them with `ffmpeg` to create new video with translated audio track. Function uses `-hwaccel cuda` option in `ffmpeg`, which requires Nvidia GPU; if no Nvidia GPU is available, remove this option. Additionally, function uses cookies from Firefox via `yt-dlp` (`--cookies-from-browser firefox`); if Firefox is not used, remove this option or replace `firefox` with preferred browser (e.g., `chrome`). The `yt-dlp` command uses `--concurrent-fragments 24` for parallel downloads, which may strain weaker systems—reduce to 8 if performance issues occur.
- **fn_new_article_for_sale**: function to create new article for sale, setting up directory structure and launching Obsidian editor.
- **fn_optimize_images**: optimizes images based on their format. Takes input directory and output directory as arguments and applies appropriate optimization tool:
  - PNG: pngquant
  - JPEG: jpegoptim
  - WEBP: cwebp (provided by libwebp package)
  - SVG: svgo
  - other formats: magick (provided by imagemagick package)
  
  **Usage**: fn_optimize_images <source_folder> <target_folder>
- **fn_convert_media**: convert audio or video files into specified format using FFmpeg. Depends on FFmpeg being installed in system. Accepts up to three arguments: path to input audio or video file, desired output extension (e.g., `mkv`, `aac`), and optional FFmpeg options passed as single string (e.g., `"-c:a copy"`). Function validates input file existence, checks output format support in FFmpeg, and generates output filename by replacing input extension with specified one.

  **Usage**: fn_convert_media <input_file> <output_extension> "<ffmpeg_options>"

  **Examples**:
  - `fn_convert_media ~/audiofolder/audiofile.mp3 aac` - converts MP3 file to AAC format.
  - `fn_convert_media ~/videofolder/videofile.mp4 mkv "-c:v h264_nvenc -c:a copy"` - re-encodes MP4 video to MKV using NVIDIA hardware acceleration for video and copying audio stream without re-encoding.<br>
- **fn_convert_media_batch**: convert multiple audio or video files from input folder into specified format using FFmpeg. Depends on FFmpeg being installed in system. Accepts up to four arguments: path to input folder with audio or video files, path to output folder for converted files, desired output extension (e.g., `mkv`, `aac`), and optional FFmpeg options passed as single string (e.g., `"-c:a copy"`). Function validates input folder existence, creates output folder if needed, and processes all files in input folder.

  **Usage**: fn_convert_media_batch <input_folder> <output_folder> <output_extension> "<ffmpeg_options>"

  **Examples**:
  - `fn_convert_media_batch ~/audiofolder ~/converted aac` - Converts all files in `~/audiofolder` to AAC format and saves them in `~/converted`.<br>
  - `fn_convert_media_batch ~/videofolder ~/converted mkv "-c:v h264_nvenc -c:a copy"` - Re-encodes all video files in `~/videofolder` to MKV using NVIDIA hardware acceleration for video and copying audio stream, saving results in `~/converted`.
  
  **Supported formats for `fn_convert_media_batch` and `fn_convert_media`**:
  - audio: `mp3`, `aac`, `m4a`, `flac`, `wav`, `ogg`, `opus`.<br>
  - video: `mp4`, `mkv`, `avi`, `mov`, `webm`, `flv`, `wmv`.
- **fn_git_clone_template**: clones a Git repository as a template without preserving Git history. This function allows copying files from a specific branch of a repository into either the current directory or a newly created project directory. It removes the original `.git` directory and initializes a fresh Git repository.

  **Usage**: fn_git_clone_template <git-repo-url> [source-branch] [new-project-name]

  **Arguments**:
  - `<git-repo-url>`: the URL of the Git repository to clone (required). Supports both HTTPS and SSH URL formats.
  - `[source-branch]`: the branch from which files will be copied (optional), master by default.
  - `[new-project-name]`: the name for the new project directory (optional).

  **Behavior**:
  - If [source-branch] is omitted, the function will use the "master" branch as the source.
  - If [new-project-name] is not provided, the files from the specified [source-branch] will be copied directly into the current working directory.
  - If [new-project-name] is specified, a new directory with this name will be created, and the files from the [source-branch] will be copied into it.
  - The .git directory from the original repository will not be copied. Instead, a new, empty Git repository will be initialized in the destination.

  **Examples**:
  - `fn_git_clone_template https://github.com/user/repo.git` - clones 'master' branch of repository into current directory.
  - `fn_git_clone_template git@github.com:user/repo.git main new-project` - clones 'main' branch of repository into new 'new-project' directory using SSH URL.
  - `fn_git_clone_template https://github.com/user/repo.git develop my-project` - clones 'develop' branch of repository into new 'my-project' directory.

## ⚙️ Setup
To use the functions in the `.zfunc` directory, add it to your ZSH `fpath` and enable autoloading in your `.zshrc`. This ensures ZSH can locate and load the functions automatically.

**Example**:
```zsh
fpath+=($HOME/.zfunc)
autoload -Uz $HOME/.zfunc/*
```
See [configs/.zshrc](../configs/.zshrc) for full configuration details.

## ⚠️ Notes
These configurations are tailored to my workflow but can be adapted with care.<br>
- **Backup First**: Always back up existing configurations before replacing them.<br>
- **Path Guidance**: Each file includes header comment indicating its target location.