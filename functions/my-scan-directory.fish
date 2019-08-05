function my-scan-directory -d "Scans the current directory with some default options"
    echo "Scanning current directory - Only infected results will show."
    clamscan --suppress-ok-results --infected --recursive
end
