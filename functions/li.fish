# Defined in - @ line 1
function li --description 'alias li exa --group-directories-first --long --sort=Name --header --git --binary'
	if [ -x /usr/bin/exa ]
		/usr/bin/exa --group-directories-first --long --sort=Name --header --git --binary $argv;
	else
		/usr/bin/li --group-directories-first --long
	end
end
