function _runsudo -d "Run current command with sudo"
	set cursor_pos (echo (commandline -C + 5 | bc)
	commandline -C 0
	commandline -i 'sudo '
	commandline -C "$cursor_pos"
end
bind \es "_runsudo"
