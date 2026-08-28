# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# make fzf use fd
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# use nvim for everything
set -o vi
SUDO_EDITOR=nvim
VISUAL=nvim
EDITOR=nvim
export EDITOR VISUAL SUDO_EDITOR 

# aliases
alias doas="sudo"
alias v="nvim"
alias rm="rm -I"
alias weather="curl wttr.in"
alias totp="ykman oath accounts code"
# for storing config files in git repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# For ncurses applications, speed up Esc press to action
ESCDELAY=10
export ESCDELAY

# set up gpg agent if on linux
if [ -z "$WSLENV" ]; then
    export GPG_TTY="$(tty)"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
fi
