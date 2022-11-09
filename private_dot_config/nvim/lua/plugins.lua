local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('plugins.telescope') end
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- LSP
    use {
        "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }

    use 'WhoIsSethDaniel/mason-tool-installer.nvim'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'onsails/lspkind-nvim'
    use 'tpope/vim-fugitive'

    -- Lint & Formatting
    use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require('plugins.null-ls') end
    }
    -- use 'MunifTanjim/prettier.nvim'

    -- Theme
    use 'ellisonleao/gruvbox.nvim'

    -- Syntax coloration
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use 'jiangmiao/auto-pairs'
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require'todo-comments'.setup {} end
    }
    use 'numToStr/Comment.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
end)
--------------------------------------------------
--       CONFIGURATION
--------------------------------------------------

-- nvim-cmp
vim.opt.completeopt = 'menu,menuone,noselect'

local cmp_status, cmp = pcall(require, 'cmp')
if (not cmp_status) then return end

local lspkind = require('lspkind')
cmp.setup {
    snippet = {
        expand = function(args) require'luasnip'.lsp_expand(args.body) end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = {
        {name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'luasnip'},
        {name = 'buffer'}, {name = 'path'}
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s",
                                          lspkind.presets.default[vim_item.kind],
                                          vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "ﲳ",
                nvim_lua = "",
                treesitter = "",
                path = "ﱮ",
                buffer = "﬘",
                zsh = "",
                luasnip = "",
                spell = "暈"
            })[entry.source.name]
            return vim_item
        end
    }
}

-- TREESITTER
require'nvim-treesitter.configs'.setup {
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {enable = true},
    indent = {enable = false, disable = {}},
    ensure_installed = {
        "bash", "go", "json", "javascript", "typescript", "vue", "html", "scss",
        "css", "rust"
    }
}

-- Comment
require('Comment').setup()
