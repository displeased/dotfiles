#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

# ~/.bashrc: executed by bash(1) for non-login shells.

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ~/.config/bash: modular configuration loader
# see the ddm config bashext for more info

MOD_CONF_LOCATION="$HOME/.config/bash"

if [ -d "$MOD_CONF_LOCATION" ]; then
    for file in "$MOD_CONF_LOCATION"/*; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
    done
fi
unset file
