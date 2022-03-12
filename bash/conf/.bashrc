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

for file in ~/.config/bash/{env,prompt,color,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
