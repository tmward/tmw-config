# use nvim for everything
set -o vi
VISUAL=nvim
EDITOR=nvim
export EDITOR VISUAL


PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin

# PATH additions
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# OpenBSD .profile defaulted to this below
export PATH HOME TERM

# make fzf use fd
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# aliases
alias v="nvim"
alias weather="curl wttr.in"
alias totp="ykman oath accounts code"
alias snip="slurp | grim -g - ~/snip.png"
# for storing config files in git repo
alias config="/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# janet config
JANET_PATH="$HOME/src/janet"
export JANET_PATH
alias janet-repl="janet -e \"(import spork/netrepl) (netrepl/server)\""

# make random directories to work in
function tmp {
  cd "$(mktemp -d /tmp/$1.XXXX)"
}
