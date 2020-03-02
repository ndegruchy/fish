function gif2vid -d "Converts a gif into a video (WebM)"
    if [ -x /usr/bin/ffmpeg ]
	    /usr/bin/ffmpeg -i $argv -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -crf 7 -b:v 10000K $argv.webm
    else
	    echo "ffmpeg is required to run this script."
	    exit 1
    end
end
