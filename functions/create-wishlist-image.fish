function create-wishlist-image -d "Creates a new wishlist image and copies it to the right directory"
         mogrify $argv -thumbnail '128x128' -background white -gravity center -extent 128x128 $argv
         mv $argv ~/Documents/Projects/degruchy.org/assets/images/wishlist
end
