function rundiablo -d "Runs Diablo 3 from the right directory"
    cd "/media/Games/Diablo III/"
    setarch i386 -L -B -R -3 /usr/bin/wine "/media/Games/Diablo III/Diablo III.exe" -launch -opengl
end
