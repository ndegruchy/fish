function trash -d "Trash some files"
	# TODO: Check for trash programs and use the first available
	if set -q argv
		kioclient5 move "$argv" trash:/
	else
		echo "No files input"
	end
end