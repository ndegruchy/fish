set fish_greeting "Welcome back, Commander."

# # Locale
# set -x LANG "en_US.UTF-8"

# # Path modification
# if [ -d "$HOME/.local/bin/" ]
#     set -a PATH "$HOME/.local/bin"
# end

# if [ -x /usr/bin/ruby ] && [ -x /usr/bin/gem ]
#    set -l RUBYGEMPATH (ruby -e 'puts Gem.user_dir')/bin
#    set -a PATH $RUBYGEMPATH
# end

# # Set default locations
# set -x XDG_CONFIG_HOME "$HOME/.config"
# set -x XDG_CACHE_HOME "$HOME/.cache"
# set -x XDG_DATA_HOME "$HOME/.local/share"
# set -x XDG_TEMPLATES_DIR "$XDG_DATA_HOME/templates"
# set -x XDG_DOCUMENTS_DIR "$HOME/Documents"
# set -x XDG_DOWNLOAD_DIR "$HOME/Downloads"
# set -x XDG_PICTURES_DIR "$HOME/Pictures"
# set -x XDG_DESKTOP_DIR "$XDG_DOCUMENTS_DIR"
# set -x XDG_MUSIC_DIR "$XDG_DOCUMENTS_DIR"
# set -x XDG_PUBLICSHARE_DIR "$XDG_DOCUMENTS_DIR/Public"
# set -x XDG_VIDEOS_DIR "$XDG_DOCUMENTS_DIR/Videos"

# # Some default theming stuff
# set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
# set -x XCURSOR_THEME "capitaine-cursors"
# set -x QT_QPA_PLATFORMTHEME "qt5ct"

# # Support XDG Locations
# set -x ASPELL_CONF "per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"
# set -x BASH_COMPLETION_USER_FILE "$XDG_CONFIG_HOME/bash-completion/bash_completion"
# set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
# set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
# set -x DVDCSS_CACHE "$XDG_DATA_HOME/dvdcss"
# set -x ELECTRON_TRASH "gio trash"
# set -x GEM_HOME "$XDG_DATA_HOME/gem"
# set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME/gem"
# set -x GNUSTEP_USER_ROOT "$XDG_CONFIG_HOME/windowmaker"
# set -x GIMP2_DIRECTORY "$XDG_CONFIG_HOME/gimp"
# set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
# set -x GTK_RC_FILES "$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
# set -x HISTFILE "$XDG_DATA_HOME/bash/history"
# set -x ICEAUTHORITY "$XDG_CACHE_HOME/ICEauthority"
# set -x INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
# set -x LESSHISTFILE "$XDG_CACHE_HOME/less/history"
# set -x LESSKEY "$XDG_CONFIG_HOME/less/lesskey"
# set -x MOZ_GTK_TITLEBAR_DECORATION "client"
# set -x MOZ_WEBRENDER 1
# set -x NCMPCPP_DIRECTORY "$XDG_CONFIG_HOME/ncmpcpp"
# set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
# set -x RANGER_LOAD_DEFAULT_RC false
# set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
# set -x SCREENRC "$XDG_CONFIG_HOME/screen/screenrc"
# set -x TERMINFO "$XDG_DATA_HOME/terminfo"
# set -x TERMINFO_DIRS "$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
# set -x WEECHAT_HOME "$XDG_CONFIG_HOME/weechat"
# set -x XCOMPOSECACHE "$XDG_CACHE_HOME/X11/xcompose"
# set -x XCOMPOSEFILE "$XDG_CONFIG_HOME/X11/xcompose"
# set -x XDG_SESSION_COOKIE "$XDG_CACHE_HOME/dbus"
# set -x __GL_SHADER_DISK_CACHE_PATH "$XDG_CACHE_HOME/nv"
# set -x __GL_THREADED_OPTIMIZATIONS 1

# set -x OFFICIAL_PACKAGE_LIST "/etc/pkglist.txt"

# # Disable accessibility services
# set -x NO_AT_BRIDGE 1

# # Font rendering cleanup for Java apps
# set -x _JAVA_OPTIONS "-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
# set -x FT2_SUBPIXEL_HINTING 2

# # Wine
# set -x WINEPREFIX "$XDG_DATA_HOME/wine"
# set -x WINEDLLOVERRIDES "winemenubuilder.exe=d"
# set -x WINEDEBUG "-all"
# set -x __GL_SYNC_TO_VBLANK 0
# set -x __GL_YIELD "NOTHING"

# # Editor
# set -x EDITOR "$HOME/.local/bin/emc"
# set -x VISUAL "$HOME/.local/bin/emc"
# set -x SUDO_EDITOR "$HOME/.local/bin/emc"

# # Less
# set -x LESSSECURE 1

# # Browser
# if [ ! -s "$BROWSER" ]
#     if [ -x /usr/bin/firefox ]
# 	set -x BROWSER "/usr/bin/firefox > /dev/null 2>&1"
#     else if [ -x /usr/bin/chromium ]
# 	set -x BROWSER "/usr/bin/chromium > /dev/null 2>&1"
#     else
# 	set -x BROWSER /usr/bin/curl
#     end
# end

# # Keyring support
# if test -n "$DESKTOP_SESSION"
#     set (gnome-keyring-daemon --start | string split "=")
# end

# # FFF
# set -x FFF_OPENER "mimeo"
# set -x FFF_TRASH "$HOME/.local/share/Trash"
# set -x FFF_TRASH_CMD "trash-put"
# set -x FFF_MARK_FORMAT "> %f <"
# set -x FFF_KEY_GO_TRASH "off"
# set -x FFF_FAV1 "/"
# set -x FFF_FAV2 "$HOME/Downloads"
# set -x FFF_FAV3 "$HOME/Pictures"
# set -x FFF_FAV4 "/run/media/ndegruchy"
# set -x FFF_FAV5 "$HOME/Documents/Projects"

# Fixes for SimpleTerminal
# Stolen shamelessly from: https://github.com/fish-shell/fish-shell/issues/2139#issuecomment-305506138
if status --is-interactive
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

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
