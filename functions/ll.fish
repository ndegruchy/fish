function ll -d "Use exa to display long formatted list of files"
    if [ -x /usr/bin/exa ]
        exa --long --all --header --time-style=long-iso --git --group-directories-first --sort=Name $argv
    else
        ls -alh --group-directories-first
    end
end
