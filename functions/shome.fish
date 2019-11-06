function shome -d "Uses fzf, fd and feh to display a selection of images"
    if test ! -x /usr/bin/fzf -o ! -x /usr/bin/feh -o ! -x /usr/bin/fd
	echo "fzf, fd or feh (or all of them) not found. Exiting."
	return 1
    end

    feh (fd --ignore-case --max-depth 1 --extension gif --extension jpg --extension png | fzf -i --multi --prompt="Select some images with TAB >") $argv
end
