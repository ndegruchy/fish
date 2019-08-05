function ll -d "Use exa to display long formatted list of files"
    if [ -x /usr/bin/exa ]
	exa --long --all --header --time-style=long-iso --git --group-directories-first $argv
    else
	ls -alh
    end
end
