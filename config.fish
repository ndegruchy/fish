set fish_greeting "Welcome back, Commander."
set -x EDITOR /usr/bin/emacs
set -x PATH $PATH /home/ndegruchy/.gem/ruby/2.2.0/bin ~/.local/share/node_modules/bin ~/.local/share/bin
set -x LESSSECURE 1
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
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -x SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
set -x XCOMPOSEFILE "$XDG_CONFIG_HOME"/x11/xcompose
set -x TERMINFO "$XDG_DATA_HOME"/terminfo
set -x TERMINFO_DIRS "$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

# Proxy settings (mainly for Chrome)
set -x http_proxy  "localhost:8118"
set -x https_proxy "localhost:8118"

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
