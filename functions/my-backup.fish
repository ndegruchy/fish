function my-backup -d "Mounts backup and runs borg"

	# Check for borg, first, bail out if it's not found
	if [ ! -x /usr/bin/borg ]
	    echo "Borg not found, please install before running this script."
	    exit 1
	end

	# Check to see if the repo pass is available. We use this to avoid
	# typing passwords all the time
	set -x BORG_PASSCOMMAND "cat /home/ndegruchy/.config/borg/repo-pass"
	set -x CURRENT_DIR (pwd)

	# What to back up
	# Home Dir Top Level
	set -x BACKUP_FILES Documents Pictures .config .local .gnupg .xsession
	# Home misc
	set -a BACKUP_FILES /home/ndegruchy/.local/share/Steam/userdata/9974372/
	# Etc
	set -a BACKUP_FILES /etc/pacman.conf /etc/makepkg.conf
	# Emacs
	set -a BACKUP_FILES /usr/share/emacs/site-lisp/default.el
	# Package lists
	set -a BACKUP_FILES $MY_AUR_LIST $OFFICIAL_PACKAGE_LIST

	# Pacman package list backups, these are mine, the system will
	# (eventually) generate a full list at /etc/pkglist.txt
	echo "Exporting Pacman package lists"
	pacman -Qqem > $MY_AUR_LIST

	# Go home, for context
	cd ~

	# Check to see if the backup share is mounted, if not mount it
	if [ ! -d /mnt/backups/degruchy ]
	    echo "Mounting backup share to /mnt/backups/"
	    echo "You will need your password to do this."
	    sudo mount --types cifs //degruchy-stor.degruchy.org/Backups /mnt/backups/ --options credentials=/etc/samba/credentials,uid=1000,gid=1000,rw
	end

	echo "Trying to create a backup in /mnt/backups/degruchy with today's date and hostname."

	borg create --stats --progress --comment "New automated backup of critical stuff" --compression auto,lzma,6 /mnt/backups/degruchy::(date +%F)-(hostname) $BACKUP_FILES --exclude-from ~/.config/borg/exclude-file

	set -x IS_PHONE_PLUGGED (lsusb | grep -i "Apple" | wc -l)

	if [ $IS_PHONE_PLUGGED -gt 0 ]
	    ## TODO: The phone data is copied locally, first, probably a
	    ## good idea to check for available space, first.
	    echo "Looks like your phone is plugged in, backing that up, too..."
	    set -x PHONETEMP $HOME/.cache/temp/(date +%F)-nathans_phone
	    mkdir $PHONETEMP
	    idevicebackup2 backup $PHONETEMP
	    borg create --stats --progress --comment "Nathan's Phone backup" --compression auto,lzma,6 /mnt/backups/iPhoneBackups/::(date +%F)-nathans_phone $PHONETEMP
	    rm -rf $PHONETEMP
	end
	
	echo "Checking for backup prunability..."
	
	# Clean up old backups
	echo "Pruning..."
	borg prune --list --keep-daily 7 --keep-weekly 4 --keep-monthly 6 /mnt/backups/degruchy/
	borg prune --list --keep-daily 7 --keep-weekly 4 --keep-monthly 6 /mnt/backups/iPhoneBackups/

	echo "Unmounting backup. You may need your password again."
	sudo umount /mnt/backups
	echo "All done!"

		# Go back to where you were, if not already there
	if [ -d $CURRENT_DIR ]
	    cd $CURRENT_DIR
	else
	    cd ~
	end

	# Dump all the variables
	set -e CURRENT_DIR
	set -e BORG_PASSCOMMAND
	set -e BACKUP_FILES
	set -e IS_PHONE_PLUGGED
	set -e PHONETEMP
end
