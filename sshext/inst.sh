#!/usr/bin/env sh

# if bash is installed install its extensions
if [ -n "$(command -v ssh)" ]; then
    return 0
else
    return 1
fi
