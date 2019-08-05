function ytdl -d "Download Videos with YouTube-DL"
         /usr/bin/youtube-dl --output '%(title)s.%(ext)s' --restrict-filenames --write-thumbnail --prefer-free-formats --write-sub --add-metadata --sub-format best --sub-lang en --ignore-errors "$argv"
end
