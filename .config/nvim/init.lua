-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
          },
          true,
          {}
        )
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim wants the following so mappings are correct
vim.g.mapleader = ' '
vim.g.maplocalleader = ";"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "ellisonleao/gruvbox.nvim",
            priority = 1000,
            config = true,
            opts = ... 
        },
        { "Olical/conjure" },
        { "R-nvim/R.nvim",
            lazy = false
        },
        -- TODO Add conform.nvim to replace neomake/neoformat
        { "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local configs = require("nvim-treesitter.configs")
                configs.setup({
                    ensure_installed = { 
                        "bibtex", "c", "clojure", "csv", "diff", "fennel",
                        "git_config", "gitcommit", "gitignore", "go", "gpg",
                        "html", "janet_simple", "lua", "make",
                        "markdown", "muttrc", "perl", "python", "r", "sql",
                        "ssh_config", "tmux", "tsv", "vim", "vimdoc", "xml"
                    },
                    sync_install = false,
                    highlight = { enable = true },
                    indent = { enable = true },
                })
            end
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
--

-- General preferences
vim.o.number  = true -- number lines
vim.o.mouse='n' -- resize panes with mouse in normal mode
vim.o.incsearch = true -- Highlight while searching
vim.o.ignorecase = true -- search ignores case 
vim.o.smartcase = true -- unless search term has an uppercase in it

-- Colors
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd.colorscheme('gruvbox')

-- Make splits happen more naturally
vim.o.splitbelow = true
vim.o.splitright = true

-- sets the format program to par
-- gq command calls par
-- gw still calls vims internal formatter
-- sets width of 72 and -q means to understand quoting like in emails
vim.o.formatprg = 'par -q -w72'

-- Formatting options
vim.o.tabstop=4 -- <Tab> displays as 4 spaces wide
vim.o.shiftwidth=4 -- number of spaces to use for each step of (auto)indent
vim.o.expandtab = true -- spaces now > tab :(
vim.o.textwidth=72 -- for git, writing, general life, wrap at 72 chars

-- for python, use black preference of 88
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.textwidth = 88
    end
})
-- R: tidyverse style guide preferences
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"r", "rmd"},
    callback = function()
        vim.opt_local.textwidth = 88
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})
-- writing formats: semantic line breaks, so disable textwidth
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"groff", "markdown", "tex"},
    callback = function()
        vim.opt_local.textwidth = 0
    end
})
-- no laws with the sql
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.opt_local.textwidth = 0
    end
})
-- keep tab and no linewrap for sh, csv, tsv
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"sh", "csv", "tsv"},
    callback = function()
        vim.opt_local.textwidth = 0
        vim.opt_local.expandtab = false
    end
})

-- Detect janet files as a filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.janet" },
    callback = function()
        vim.opt_local.filetype = "janet"
    end
})

-- Detect tsv files as a filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.tsv" },
    callback = function()
        vim.opt_local.filetype = "tsv"
    end
})

