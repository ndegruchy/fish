function trash -d "Trash some files"
	if set -q argv
		kioclient5 move "$argv" trash:/
	else
		echo "No files input"
	end
end