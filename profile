# Locale
export LANG="en_US.UTF-8"

# Some default theming stuff
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export XCURSOR_THEME=capitaine-cursors

# Set default locations
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Support XDG Locations
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DVDCSS_CACHE="$XDG_DATA_HOME"/dvdcss
export ELECTRON_TRASH="gio trash"
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GNUSTEP_USER_ROOT="$XDG_CONFIG_HOME"/windowmaker
export GIMP2_DIRECTORY="$XDG_CONFIG_HOME"/gimp
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export MOZ_GTK_TITLEBAR_DECORATION=client
export MOZ_WEBRENDER=1
export NCMPCPP_DIRECTORY="$XDG_CONFIG_HOME"/ncmpcpp
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export RANGER_LOAD_DEFAULT_RC=false
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export XCOMPOSECACHE="$XDG_CACHE_HOME"/X11/xcompose
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/X11/xcompose
export XDG_SESSION_COOKIE="$XDG_CACHE_HOME"/dbus
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
export __GL_THREADED_OPTIMIZATIONS=1

export OFFICIAL_PACKAGE_LIST="/etc/pkglist.txt"
export MY_AUR_LIST="$HOME/Documents/aur_packages.txt"

# Disable accessibility services
export NO_AT_BRIDGE=1

# Font rendering cleanup for Java apps
export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export FT2_SUBPIXEL_HINTING=2

# Wine
export WINEPREFIX=$XDG_DATA_HOME/wine
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export WINEDEBUG="-all"
export __GL_SYNC_TO_VBLANK=0
export __GL_YIELD="NOTHING"

# Editor
export EDITOR=/home/ndegruchy/.local/bin/emc
export VISUAL=/home/ndegruchy/.local/bin/emc
export SUDO_EDITOR=/home/ndegruchy/.local/bin/emc

# Paths
export PATH=$PATH:$HOME/.local/bin/

# Less
export LESSSECURE=1

# Browser
export BROWSER=/usr/bin/firefox
