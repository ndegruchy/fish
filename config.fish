set fish_greeting "Welcome back, Commander."

# Locale
set -gx LANG "en_US.UTF-8"

# Set default locations
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share

# Support XDG Locations
set -gx ASPELL_CONF "per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -gx DVDCSS_CACHE "$XDG_DATA_HOME"/dvdcss
set -gx ELECTRON_TRASH "gio trash"
set -gx GEM_HOME "$XDG_DATA_HOME"/gem
set -gx GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -gx GNUSTEP_USER_ROOT "$XDG_CONFIG_HOME"/windowmaker
set -gx GIMP2_DIRECTORY "$XDG_CONFIG_HOME"/gimp
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -gx GTK_RC_FILES "$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
set -gx ICEAUTHORITY "$XDG_CACHE_HOME"/ICEauthority
set -gx INPUTRC "$XDG_CONFIG_HOME"/readline/inputrc
set -gx LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -gx LESSKEY "$XDG_CONFIG_HOME"/less/lesskey
set -gx MOZ_GTK_TITLEBAR_DECORATION client
set -gx MOZ_WEBRENDER 1
set -gx NCMPCPP_DIRECTORY "$XDG_CONFIG_HOME"/ncmpcpp
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set -gx RANGER_LOAD_DEFAULT_RC false
set -gx RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -gx SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
set -gx SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
set -gx TERMINFO "$XDG_DATA_HOME"/terminfo
set -gx TERMINFO_DIRS "$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
set -gx WEECHAT_HOME "$XDG_CONFIG_HOME"/weechat
# set -gx XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority # Doesn't seem to do anything but make xsessions fail to load
set -gx XCOMPOSECACHE "$XDG_CACHE_HOME"/X11/xcompose
set -gx XCOMPOSEFILE "$XDG_CONFIG_HOME"/X11/xcompose
set -gx XDG_SESSION_COOKIE "$XDG_CACHE_HOME"/dbus
set -gx __GL_SHADER_DISK_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -gx __GL_THREADED_OPTIMIZATIONS 1

# Packages
if [ -x /usr/bin/pacman ]
    set -x OFFICIAL_PACKAGE_LIST "/etc/pkglist.txt"
    set -x MY_AUR_LIST "$HOME/Documents/aur_packages.txt"
end

# Disable accessibility services
set -x NO_AT_BRIDGE 1

# Font rendering cleanup for Java apps
set -x _JAVA_OPTIONS "-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
set -x FT2_SUBPIXEL_HINTING 2

# Wine
set -x WINEPREFIX $XDG_DATA_HOME/wine
# set -x WINEARCH   win32
set -x WINEDLLOVERRIDES "winemenubuilder.exe=d"
set -x WINEDEBUG -all
set -x __GL_SYNC_TO_VBLANK 0
set -x __GL_YIELD "NOTHING"

# Editor
if [ -f /home/ndegruchy/.local/bin/emc ]
    set -x EDITOR /home/ndegruchy/.local/bin/emc
    set -x VISUAL /home/ndegruchy/.local/bin/emc
    set -x SUDO_EDITOR /home/ndegruchy/.local/bin/emc
else if [ -f /usr/bin/kate ]
    set -x EDITOR /usr/bin/kate
    set -x VISUAL /usr/bin/kate
    set -x SUDO_EDITOR /usr/bin/kate
else
    set -x EDITOR /usr/bin/nano
    set -x VISUAL /usr/bin/nano
    set -x SUDO_EDITOR /usr/bin/nano
end

# SSH
if [ -f /usr/bin/plink ]
    set -x GIT_SSH /usr/bin/plink
end

# SSH + KDE
if [ -f $XDG_CONFIG_HOME/autostart-scripts/ssh-add.sh ]; and [ -f /usr/bin/startkde ]
    set -x SSH_ASKPASS (which ksshaskpass)
end

# Ruby gems
if [ -f /usr/bin/gem ]
    set -a PATH $HOME/.gem/*/bin
end

# Local node modules
if [ -d /home/ndegruchy/.local/share/node_modules/bin ]; and [ -x /usr/bin/npm ]
    set -a PATH $XDG_DATA_HOME/node_modules/bin
end

# Local special binaries/scripts
if [ -d /home/ndegruchy/.local/bin ]
    set -a PATH ~/.local/bin
end

# Crossover
if [ -d /opt/cxoffice/bin ]
    set -a PATH /opt/cxoffice/bin
end

# Midnight Commander (XDG-Open Alternative)
if [ -f /bin/mimeo ]
    set -x MC_XDG_OPEN /bin/mimeo
end

# Configure Less to be _more_ secure
set -x LESSSECURE 1

# Default browser
set -x BROWSER /usr/bin/firefox
# set -x BROWSER /usr/bin/chromium

# Check for perl directories (Arch stuff)
if [ -d /usr/bin/site_perl ]
    set -a PATH /usr/bin/site_perl
end

if [ -d /usr/lib/perl5/site_perl/bin ]
    set -a PATH /usr/lib/perl5/site_perl/bin
end

if [ -d /usr/bin/vendor_perl ]
    set -a PATH /usr/bin/vendor_perl
end

if [ -d /usr/lib/perl5/vendor_perl/bin ]
    set -a PATH /usr/lib/perl5/vendor_perl/bin
end

if [ -d /usr/bin/core_perl ]
    set -a PATH /usr/bin/core_perl
end

# Arch Java stuff
if [ -d /usr/bin/jvm/default/bin ]
    set -a PATH /usr/bin/jvm/default/bin
end

# Arch Mozilla stuff
if [ -d /usr/lib/mozilla/plugins ]
    set -x MOZ_PLUGIN_PATH /usr/lib/mozilla/plugins
end

if [ -f $XDG_CONFIG_HOME/dircolors/dircolors ]
    eval (dircolors -c $XDG_CONFIG_HOME/dircolors/dircolors | sed 's/>&\/dev\/null$//')
end

# Kitty
if [ -x /usr/bin/kitty ]
    kitty + complete setup fish | source
end

# ALSA

set -x ALSA_CARD Headset

# Fixes for SimpleTerminal
# Stolen shamelessly from: https://github.com/fish-shell/fish-shell/issues/2139#issuecomment-305506138
if status is-interactive
    switch $TERM

        # Fix DEL key in st
        case 'st*'
            set -gx is_simple_terminal 1

        case "linux"
            set -ex is_simple_terminal
            function fish_prompt
                fish_fallback_prompt
            end
    end

    if set -q is_simple_terminal
        tput smkx ^/dev/null
        function fish_enable_keypad_transmit --on-event fish_postexec
            tput smkx ^/dev/null
        end

        function fish_disable_keypad_transmit --on-event fish_preexec
            tput rmkx ^/dev/null
        end
    end
end
