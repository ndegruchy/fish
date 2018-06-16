function -d "Compresses and retitles my resume PDF"
	cd /home/ndegruchy/Documents/Projects/resume/
	exiftool -Title="Nathan DeGruchy's Resume" main.pdf
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=ndegruchy-resume.pdf main.pdf
	mv ndegruchy-resume.pdf /home/ndegruchy/Documents/Projects/degruchy.org/assets/files/ndegruchy-resume.pdf
end
