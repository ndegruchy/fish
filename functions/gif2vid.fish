function gif2vid -d "Converts a gif into a video (WebM)"
    ffmpeg -i $argv -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -crf 7 -b:v 10000K $argv.webm
end
