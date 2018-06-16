function shrink-pdf -d "Shrinks a PDF with GhostScript"
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=($argv)-small.pdf $argv
end
