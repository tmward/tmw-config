# Setting up git

You should setup a bare git repository in your home directory. Great
instructions are availabe below:

https://www.atlassian.com/git/tutorials/dotfiles

# neovim

I use [vim-plug](https://github.com/junegunn/vim-plug). To set-up neovim
and all the plugins that are listed in the `init.vim` on a new setup:

1. Make sure neovim is installed
2. Use the .config/nvim/init.vim provided
3. [Install](https://github.com/junegunn/vim-plug#installation) vim-plug
4. `mkdir -p $HOME/.local/share/nvim/plugins`
5. Open nvim and run `:PlugInstall`

Enjoy.

# Shell

I use the MirBSD Korn shell, [mksh](http://www.mirbsd.org/mksh.htm),
since it's portable, similar to OpenBSD's default ksh, and smaller than
bash. Configuration is stored in `.mkshrc`. All those configuration
settings are portable, so they will work in a `.bashrc` as well.

# License

All non-configuration files (aka the little shell scripts I wrote) are
licensed under the ISC license. A copy is provided at the root of the
repository.
