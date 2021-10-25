# When logging in start the X automatically
[[ -f ~/.zshrc ]] && ~/.zshrc 2> /dev/null
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

# Source cargo environment
. "$HOME/.cargo/env"
