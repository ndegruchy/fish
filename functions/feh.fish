function feh -d "Feh with some default options"
    if [ -x /usr/bin/feh ]
	/usr/bin/feh --auto-zoom --auto-rotate --draw-filename --draw-tinted --fullscreen --borderless --geometry 1920x1080 --image-bg black $argv
    else
	echo "Feh doesn't seem to be installed."
	exit 1
    end
end
