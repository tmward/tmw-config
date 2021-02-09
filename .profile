# include .bashrc if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# if on WSL, make X11 forwarding from WSL -> Windows work
if [ -n "$WSLENV" ]; then
    . "$HOME/.local/bin/fix_wsl_x11_forwarding.sh"
fi
