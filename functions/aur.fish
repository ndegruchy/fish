function aur -d "Fetch a package from AUR4"
    set -l projdir "/home/ndegruchy/Projects/aur/"
    set -l appldir $projdir/$argv
    git clone https://aur4.archlinux.org/$argv.git $projdir/$argv
    cd $appldir
end