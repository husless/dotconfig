local indent = 4

local options = {
  autoindent = true,
  clipboard = "unnamed,unnamedplus",
  completeopt = "menu,menuone,noselect,noinsert",
  cursorline = true,
  -- cmdheight = 2, -- more space for nvim command line to display messages.
  expandtab = true,
  fileencodings = "utf-8,gbk,gb2312,gb18030",
  fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
  },
  foldenable = false,
  foldmethod = "indent",
  tabstop = indent,
  termguicolors = true,
  hidden = true,
  hlsearch = true, -- highlight all matches on precious search pattern
  ignorecase = true, -- ignore case in search patterns
  listchars = {
    tab = "»·",
    trail = "·",
    extends = "↪",
    precedes = "↩",
  },
  mouse = "",
  relativenumber = true,
  pumheight = 10, -- pop up menu height
  scrolloff = 4,
  shiftwidth = indent,
  showmode = false,
  smartcase = true,
  smartindent = true, -- make indenting smarter again
  smarttab = true,
  softtabstop = indent,
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  wildignore = { "*.o", "*~", "*.pyc", "*pycache*" },
  wrap = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
