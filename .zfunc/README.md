# .zfunc

This directory contains ZSH functions that provide additional functionality and automation for various tasks.

## Functions

- **fn_youtube_video_translate**: Automatically translates YouTube videos into Russian. It uses `vot-cli` with Yandex API to translate audio into Russian, downloads video using `yt-dlp`, and combines them with `ffmpeg` to create new video with translated audio track. Function uses `-hwaccel cuda` option in `ffmpeg`, which requires Nvidia GPU; if no Nvidia GPU is available, remove this option. Additionally, function uses cookies from Firefox via `yt-dlp` (`--cookies-from-browser firefox`); if Firefox is not used, remove this option or replace `firefox` with preferred browser (e.g., `chrome`). The `yt-dlp` command uses `--concurrent-fragments 24` for parallel downloads, which may strain weaker systems—reduce to 8 if performance issues occur.
- **fn_new_article_for_sale**: Function to create new article for sale, setting up directory structure and launching Obsidian editor.
- **fn_optimize_images**: Optimizes images based on their format. Takes input directory and output directory as arguments and applies appropriate optimization tool:
  - PNG: pngquant
  - JPEG: jpegoptim
  - WEBP: cwebp (provided by libwebp package)
  - SVG: svgo
  - Other formats: magick (provided by imagemagick package)<br>
  **Usage**: fn_optimize_images <source_folder> <target_folder>
- **fn_convert_media**: Convert audio or video files into specified format using FFmpeg. Depends on FFmpeg being installed in system. Accepts up to three arguments: path to input audio or video file, desired output extension (e.g., `mkv`, `aac`), and optional FFmpeg options passed as single string (e.g., `"-c:a copy"`). Function validates input file existence, checks output format support in FFmpeg, and generates output filename by replacing input extension with specified one.<br>
  **Usage**: fn_convert_media <input_file> <output_extension> "<ffmpeg_options>"<br>
  **Examples**:<br>
  `fn_convert_media ~/audiofolder/audiofile.mp3 aac` - Converts MP3 file to AAC format.<br>
  `fn_convert_media ~/videofolder/videofile.mp4 mkv "-c:v h264_nvenc -c:a copy"` - Re-encodes MP4 video to MKV using NVIDIA hardware acceleration for video and copying audio stream without re-encoding.<br>
- **fn_convert_media_batch**: Convert multiple audio or video files from input folder into specified format using FFmpeg. Depends on FFmpeg being installed in system. Accepts up to four arguments: path to input folder with audio or video files, path to output folder for converted files, desired output extension (e.g., `mkv`, `aac`), and optional FFmpeg options passed as single string (e.g., `"-c:a copy"`). Function validates input folder existence, creates output folder if needed, and processes all files in input folder.<br>
  **Usage**: fn_convert_media_batch <input_folder> <output_folder> <output_extension> "<ffmpeg_options>"<br>
  **Examples**:<br>
  `fn_convert_media_batch ~/audiofolder ~/converted aac` - Converts all files in `~/audiofolder` to AAC format and saves them in `~/converted`.<br>
  `fn_convert_media_batch ~/videofolder ~/converted mkv "-c:v h264_nvenc -c:a copy"` - Re-encodes all video files in `~/videofolder` to MKV using NVIDIA hardware acceleration for video and copying audio stream, saving results in `~/converted`.<br>
  **Supported formats for `fn_convert_media_batch` and `fn_convert_media`**:<br>
  - audio: `mp3`, `aac`, `m4a`, `flac`, `wav`, `ogg`, `opus`.<br>
  - video: `mp4`, `mkv`, `avi`, `mov`, `webm`, `flv`, `wmv`.

## ⚙️ Setup
To use the functions in the `.zfunc` directory, add it to your ZSH `fpath` and enable autoloading in your `.zshrc`. This ensures ZSH can locate and load the functions automatically.<br>
**Example**:<br>
```zsh
fpath+=($HOME/.zfunc)
autoload -Uz $HOME/.zfunc/*
```
See [configs/.zshrc](../configs/.zshrc) for full configuration details.

## ⚠️ Notes
These configurations are tailored to my workflow but can be adapted with care.<br>
- **Backup First**: Always back up existing configurations before replacing them.<br>
- **Path Guidance**: Each file includes header comment indicating its target location.