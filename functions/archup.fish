function archup -d "Run pacman updates"
    # Check for updates first, using checkupdates
    set -l cs (checkupdates)
    # If there are updates (any updates) run pacman
    if test (count $cs) -gt 0
       echo "Updates available, running pacman"
       sudo pacman -Syu
    else
       # Otherwise, print no updates available
       echo "No updates available"
    end
end