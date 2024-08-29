# Setting up git

You should setup a bare git repository in your home directory. Great
instructions are availabe below:

https://www.atlassian.com/git/tutorials/dotfiles

## Abbreviated instructions to start fresh
This is relatively easy. You just need to create a new bare git repo in `$HOME/.cfg`
then make a shell alias called `config` to make calling git on it more convenient:

1. Make bare git repo

```
git init --bare $HOME/.cfg
```

2. Make an `config` alias for git to call it easily

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Replace `.bashrc` with you preferred shell configuration file.

3. Do not show untracked files so `config status` output is uncluttered

```
config config --local status.showUntrackedFiles no
```


## Abbreviated instructions to use this git repo for conf files on a new machine

1. Make a config alias for git

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

2. Ignore the `.cfg` directory so git recursion issues do not happen

```
echo ".cfg" >> .gitignore
```

3. Clone the repo

```
git clone --bare git@github.com/tmward/tmw-config $HOME/.cfg
```

4. Checkout the git files into your home directory

```
config checkout
```

If it fails due to you already having some of the files in your home directory,
you will need to remove them/back them up then `config checkout` again.

5. Do not have `config status` show untracked files

```
config config --local status.showUntrackedFiles no
```

Now you are ready to use the `config` alias to manage your dotfiles.

# neovim

All plugins should automatically install using
[lazy.nvim](https://github.com/folke/lazy.nvim).

# Shell

When on linux, I use the MirBSD Korn shell,
[mksh](http://www.mirbsd.org/mksh.htm),
since it's portable, similar to OpenBSD's default ksh, and smaller than
bash. Configuration is stored in `.mkshrc`.
My configuration for OpenBSD systems is in `.kshrc`.
Configuration settings in both those files are portable,
so they will work in a `.bashrc` as well.

# License

All non-configuration files (aka the little shell scripts I wrote) are
licensed under the ISC license. A copy is provided at the root of the
repository.
