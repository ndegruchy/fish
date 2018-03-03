function aur -d "Fetch a package from AUR4"
    set -l projdir "/home/ndegruchy/Documents/AUR/"
    set -l appldir $projdir/$argv
    git clone https://aur.archlinux.org/$argv.git $projdir/$argv
    cd $appldir
end
