local indent = 4

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'
vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd 'colorscheme tokyonight'

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

local options = {
    clipboard = 'unnamed,unnamedplus',
    cursorline = true,
    cmdheight = 2,                              -- more space for nvim command line to display messages.
    expandtab = true,
    fileencodings = 'utf-8,gbk,gb2312,gb18030',
    foldenable = true,
    foldmethod = 'indent',
    shiftwidth = indent,
    tabstop = indent,
    termguicolors = true,
    hidden = true,
    hlsearch = true,                            -- highlight all matches on precious search pattern
    ignorecase = true,                          -- ignore case in search patterns
    number = true,                              -- show line number
    pumheight = 10,                             -- pop up menu height
    scrolloff = 4,
    showmode = false,
    smartcase = true,
    smartindent = true,                         -- make indenting smarter again
    splitbelow = true,                          -- force all horizontal splits to go below current window
    splitright = true,                          -- force all vertical splits to go to the right of current window
    wildmode = 'list:longest',
    wrap = false,
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
    vim.opt[k] = v
end

