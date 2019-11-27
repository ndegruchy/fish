function feh -d "Feh with some default options"
    if [ -x /usr/bin/feh ]
	/usr/bin/feh --auto-zoom --auto-rotate --draw-filename --draw-tinted --fullscreen --borderless --image-bg black --scale-down --start-at $argv
    else
	echo "Feh doesn't seem to be installed."
	return 1
    end
end
