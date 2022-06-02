-- Automaticalli install packer
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]) -- Auto compile when there are changes in plugins.lua


local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    vim.notify("cannot import packer module")
    return
end


-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}


return packer.startup(function(use)
    -- packer manages itself as an optional plugin
    use {'wbthomason/packer.nvim', opt=true}

    -- common
    use 'tpope/vim-fugitive'       -- Git commands
    use 'nvim-lua/popup.nvim'      -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim'    -- Usefull lua functions used by ny lots of plugins
    use 'lewis6991/impatient.nvim' -- fast startup
    use 'EdenEast/nightfox.nvim'   -- a color scheme
    use 'folke/tokyonight.nvim'    -- another color scheme
    use 'windwp/nvim-autopairs'

    -- Lazy loading:
    -- Load on specific commands
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Load on an autocommand event
    use {'andymass/vim-matchup', event = 'VimEnter'}

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    -- use {
    --     'w0rp/ale',
    --     ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    --     cmd = 'ALEEnable',
    --     config = 'vim.cmd[[ALEEnable]]'
    -- }

    -- snippets
    use 'L3MON4D3/LuaSnip'             -- snippet engine
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

    -- dev
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'saadparwaiz1/cmp_luasnip'
    use 'jose-elias-alvarez/null-ls.nvim'  -- formatter and linter
    use {
        'weilbith/nvim-code-action-menu',
        cmd='CodeActionMenu',
        config=function()
            vim.g.code_action_menu_show_diff = false
        end,
    } -- better code action menu

    use {
        'kyazdani42/nvim-tree.lua',
        requires={'kyazdani42/nvim-web-devicons', opt=true},
    }
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Telescope
    use 'nvim-telescope/telescope.nvim'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Python
    use { 'Vimjas/vim-python-pep8-indent', ft = 'python' }
end)

