# .zfunc

This directory contains ZSH functions that provide additional functionality and automation for various tasks.

## Functions

- **`fn_youtube_video_translate`**: Automatically translates YouTube videos into Russian. It uses `vot-cli` with the Yandex API to translate the audio into Russian, downloads the video using `yt-dlp`, and combines them with `ffmpeg` to create a new video with the translated audio track. Function uses the `-hwaccel cuda` option in `ffmpeg`, which requires an Nvidia GPU; if you don't have an Nvidia GPU, remove this option. Additionally, the function uses cookies from Firefox via `yt-dlp` (`--cookies-from-browser firefox`); if you don't use Firefox, either remove this option or replace `firefox` with your browser (e.g., `chrome`). The `yt-dlp` command also uses `--concurrent-fragments 24` for parallel downloads, which may strain weaker systems—reduce it to 8 if you experience performance issues.
- **`fn_new_article_for_sale`**: A function to create a new article for sale, setting up the directory structure and launching the Obsidian editor.
- **`fn_optimize_images`**: Optimizes images based on their format. It takes an input directory and an output directory as arguments and applies the appropriate optimization tool:
  - PNG: pngquant
  - JPEG: jpegoptim
  - WEBP: cwebp (provided by libwebp package)
  - SVG: svgo
  - Other formats: magick (provided by imagemagick package)<br>
  Usage: fn_optimize_images <source_folder> <target_folder>

## ⚙️ Setup
To use the functions in the `.zfunc` directory, add it to your ZSH `fpath` and enable autoloading in your `.zshrc`. This ensures ZSH can locate and load the functions automatically.
Example: 
```zsh
fpath+=($HOME/.zfunc)
autoload -Uz $HOME/.zfunc/*
```
Refer to `configs/.zshrc` for a complete example.

## ⚠️ Notes
These configurations are tailored to my workflow but can be adapted with care.
- **Backup First**: Always back up existing configurations before replacing them.
- **Path Guidance**: Each file includes a header comment indicating its target location.