local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Continued from the previous configuration
require("lazy").setup({
  defaults = { lazy = false },
  spec = {
    { "nvim-lua/plenary.nvim" }, -- Useful helper functions, that other plugins depend on
    { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
    { "numToStr/Comment.nvim" }, -- Easily comment stuff

    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- cool icons
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    }, -- file manager/explorer
    { "moll/vim-bbye" }, -- used to close buffers in a better way than standard vim's bdelete
    { "nvim-lualine/lualine.nvim" }, -- lua status line
    { "akinsho/toggleterm.nvim" }, -- toggle terminal
    { 'akinsho/bufferline.nvim' }, -- displays and management for buffers
    { "lewis6991/impatient.nvim" }, -- cache compiled modules, improves performance and loading time
    { "folke/which-key.nvim" }, -- guide for shortcuts/hotkeys
    { "goolord/alpha-nvim" }, -- plugin for welcome dashboard (not really used much in combination with auto-session)
    {
      "folke/noice.nvim",
      event = "VimEnter",
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      }
    },
    { "ggandor/leap.nvim" }, -- easier movement with s and S
    --[[   'rmagatti/auto-session', ]]
    --[[   config = function() ]]
    --[[     require("auto-session").setup { ]]
    --[[       log_level = "error", ]]
    --[[       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" }, ]]
    --[[     } ]]
    --[[   end ]]
    --[[ }, ]]
    {
      'ruifm/gitlinker.nvim',
      dependencies = 'nvim-lua/plenary.nvim',
    },
    { 'folke/tokyonight.nvim' },

    -- cmp plugins
    { "hrsh7th/nvim-cmp" }, -- The completion plugin
    { "hrsh7th/cmp-buffer" }, -- buffer completions
    { "hrsh7th/cmp-path" }, -- path completions
    { "hrsh7th/cmp-cmdline" }, -- cmdline completions
    { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },

    -- LSP
    { "neovim/nvim-lspconfig" }, -- enable LSP
    { "williamboman/mason.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
    {
      "j-hui/fidget.nvim",
      commit = "99b306167d1d305ca084e3bb475d6eadf32a365b"
    }, -- lsp progress bar
    { "onsails/lspkind-nvim" },

    -- -- Telescope
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    --
    -- Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    -- Folding
    -- froze ufo because latest version does not respect treesitter fold queries
    { 'kevinhwang91/nvim-ufo',                      dependencies = 'kevinhwang91/promise-async', commit = "d99d72253ce615d66e41660f68255ff2f65b4cf8" },
    -- -- Git
    { "lewis6991/gitsigns.nvim" },
    { "tpope/vim-fugitive" },
    --
    -- -- vim-test
    { "vim-test/vim-test" },
  },
})

-- Autocommand and additional configurations...
