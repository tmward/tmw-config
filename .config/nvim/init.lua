-- General preferences
vim.o.number  = true -- number lines
vim.o.mouse='n' -- resize panes with mouse in normal mode
vim.g.mapleader = ' ' -- Space is <Leader> key
vim.o.incsearch = true -- Highlight while searching
vim.o.ignorecase = true -- search ignores case 
vim.o.smartcase = true -- unless search term has an uppercase in it

-- Colors
vim.o.termguicolors = true
vim.o.background = 'dark'
--vim.cmd.colorscheme = 'gruvbox'

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

-- Options for plugins
