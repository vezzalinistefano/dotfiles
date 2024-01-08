-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Colors
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    --

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use({ 'ThePrimeagen/harpoon' })
    use({ 'mbbill/undotree' })
    use({ 'norcalli/nvim-colorizer.lua' })
    use({ 'tpope/vim-fugitive' })

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use { 'towolf/vim-helm', ft = 'helm' }

    use { 'ThePrimeagen/harpoon' }

    use { 'ggandor/leap.nvim' }

    use { 'mbbill/undotree' }

    use { 'norcalli/nvim-colorizer.lua' }

    use('tpope/vim-fugitive')

    use('tpope/vim-surround')

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- Debugger
    use { 'mfussenegger/nvim-dap' }
    use { 'leoluz/nvim-dap-go' }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- Status
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'akinsho/bufferline.nvim', tag = "v3.*" }
end)
