function my-backup -d "Runs through various backups"
    # Check for borg, first, bail out if it's not found
    if [ ! -x /usr/bin/borg ]
        echo "Borg not found, please install before running this script."
        exit 1
    end

    # Check to see if the repo pass is available. We use this to avoid
    # typing passwords all the time
    set -x BORG_PASSCOMMAND "kwallet-query --read-password borg-backup kdewallet"

    # Save the current directory
    set -x CURRENT_DIR (pwd)

    set -x NOTIFY_ICON "/usr/share/icons/breeze-dark/devices/64/drive-harddisk.svg"

    # What to back up
    # Home Dir Top Level
    set -x BACKUP_FILES Documents Pictures .config .local .gnupg
    # Home misc
    if [ -d $HOME/.local/share/Steam/userdata/9974372/ ]
        set -a BACKUP_FILES $HOME/.local/share/Steam/userdata/9974372/
    end
    # Etc
    if [ -e /etc/pacman.conf -a -e /etc/makepkg.conf ]
        set -a BACKUP_FILES /etc/pacman.conf /etc/makepkg.conf
    end

    # Emacs
    if [ -d /usr/share/emacs/site-lisp/ ]
        set -a BACKUP_FILES /usr/share/emacs/site-lisp/
    end

    # Go home, for context
    cd ~

    # Check to see if the backup share is mounted, if not mount it
    if [ ! -d /mnt/backups/degruchy ]
        set -l BACKUPPW (kwallet-query --read-password degruchy-stor kdewallet)
        echo "Mounting backup share to /mnt/backups/"
        echo "You will need your password to do this."
        sudo mount --types cifs //192.168.0.4/Backups /mnt/backups/ --options username=nathan,password=$BACKUPPW,uid=1000,gid=1000,rw,vers=3.0
    end

    echo "Trying to create a backup in /mnt/backups/degruchy with today's date and hostname."

    borg create --stats --progress --comment "New automated backup of critical stuff" --compression auto,lzma,6 /mnt/backups/degruchy::(date +%F)-(hostname) $BACKUP_FILES --exclude-from $HOME/.config/borg/exclude-file

    echo "Checking for backup prunability..."

    # Clean up old backups
    echo "Pruning..."
    borg prune --list --keep-daily 7 --keep-weekly 4 --keep-monthly 6 /mnt/backups/degruchy/

    echo "Unmounting backup. You may need your password again."
    sudo umount /mnt/backups
    echo "All done!"

    # In case this is called without a terminal
    notify-send --urgency=normal --expire-time=5000 --icon=$NOTIFY_ICON "Backup is done!"

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
    set -e NOTIFY_ICON
    set -e BACKUPPW
end
