#        _ _
#   __ _| (_) __ _ ___  ___  ___
#  / _` | | |/ _` / __|/ _ \/ __|
# | (_| | | | (_| \__ \  __/\__ \
#  \__,_|_|_|\__,_|___/\___||___/

#        _                 _ _ _
#  _ __ (_)_______ __  ___| | (_)_ _  __ _ ___
# | '  \| (_-<_-< '_ \/ -_) | | | ' \/ _` (_-<
# |_|_|_|_/__/__/ .__/\___|_|_|_|_||_\__, /__/
#               |_|                  |___/
# common misspellings of commands

# vim
alias bim=vim
alias nim=vim

# git
alias got=git
alias gir=git

# make
alias male=make

# exit
alias exot=exit

# clear
alias claer=clear

# ls
alias sl=ls

#  _ __  __ _ __ _ _ ___ ___
# | '  \/ _` / _| '_/ _ (_-<
# |_|_|_\__,_\__|_| \___/__/
#
# additional functionality/shortcuts for commands

# clears screen and lists current dir
alias cls='clear && echo "${PS1@P}""ls" && ls'
alias cla='clear && echo "${PS1@P}""ls" && ls -A'
alias cl=clear

# ls aliases
alias lh='ls -lah'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# tar aliases
alias untar='tar -xvf'

# xz with max compression and resources
alias fxz='xz -9 -T0'

# shorter unxz
alias uxz='unxz'

# unxz-like alias for gz
alias ungz='gzip -d'

# vim hex editor
alias hvim='vim -c "%!xxd" -c "set ft=xxd"'

# mkdir and cd
mkcd() { mkdir -p "$@" && cd "$@" || exit; }
