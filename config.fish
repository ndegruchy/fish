set fish_greeting "Welcome back, Commander."

# Emacs client script
set -x EDITOR /home/ndegruchy/.local/share/bin/emc

# Ruby gems
if [ -d (ruby -e "print Gem.user_dir")/bin ]
    set -x PATH $PATH (ruby -e "print Gem.user_dir")/bin
end

# Local node modules
if [ -d /home/ndegruchy/.local/share/node_modules/bin ]
    set -x PATH $PATH ~/.local/share/node_modules/bin
end

# Local special binaries/scripts
if [ -d /home/ndegruchy/.local/share/bin ]
    set -x PATH $PATH ~/.local/share/bin
end

# Crossover
if [ -d /opt/cxoffice/bin ]
    set -x PATH $PATH /opt/cxoffice/bin
end

# Configure Less to be _more_ secure
set -x LESSSECURE 1

# Default browser
set -x BROWSER /usr/bin/firefox

# Support XDG Locations
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x GIMP2_DIRECTORY "$XDG_CONFIG_HOME"/gimp
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -x GTK_RC_FILES "$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -x SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
set -x WEECHAT_HOME "$XDG_CONFIG_HOME"/weechat
set -x DVDCSS_CACHE "$XDG_DATA_HOME"/dvdcss
set -x __GL_SHADER_DISK_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -x __GL_THREADED_OPTIMIZATIONS 1
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -x SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
set -x XCOMPOSEFILE "$XDG_CONFIG_HOME"/x11/xcompose
set -x TERMINFO "$XDG_DATA_HOME"/terminfo
set -x TERMINFO_DIRS "$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
set -x NCMPCPP_DIRECTORY "$XDG_CONFIG_HOME"/ncmpcpp
set -x INPUTRC "$XDG_CONFIG_HOME"/readline/inputrc
set -x BROWSER chromium

# LibreOffice to use the more complete GTK2 plugin
set -x SAL_USE_VCLPLUGIN gtk3

# Font rendering cleanup for Java apps
set -x _JAVA_OPTIONS "-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
set -x FT2_SUBPIXEL_HINTING 2

# Wine
set -x WINEPREFIX "$XDG_CONFIG_HOME"/wine
set -x WINEARCH   win32

# Check for perl directories (Arch stuff)
if [ -d /usr/bin/site_perl ]
   set -x PATH $PATH /usr/bin/site_perl
end

if [ -d /usr/lib/perl5/site_perl/bin ]
   set -x PATH $PATH /usr/lib/perl5/site_perl/bin
end

if [ -d /usr/bin/vendor_perl ]
   set -x PATH $PATH /usr/bin/vendor_perl
end

if [ -d /usr/lib/perl5/vendor_perl/bin ]
   set -x PATH $PATH /usr/lib/perl5/vendor_perl/bin
end

if [ -d /usr/bin/core_perl ]
   set -x PATH $PATH /usr/bin/core_perl
end

# Arch Java stuff
if [ -d /usr/bin/jvm/default/bin ]
   set -x PATH $PATH /usr/bin/jvm/default/bin
end

# Arch Mozilla stuff
if [ -d /usr/lib/mozilla/plugins ]
   set -x MOZ_PLUGIN_PATH /usr/lib/mozilla/plugins
end

eval (dircolors -c ~/.config/dircolors/dircolors | sed 's/>&\/dev\/null$//')

# ALSA

set -x ALSA_CARD Headset
