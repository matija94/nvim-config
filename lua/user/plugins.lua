local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  --use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim" 
  -- using packer.nvim
  use 'akinsho/bufferline.nvim'
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  --use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "folke/which-key.nvim"
  use "RRethy/vim-illuminate"
  use "brooth/far.vim"
  use({
    "folke/noice.nvim",
    --[[ event = "VimEnter", ]]
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })
  use "petertriho/nvim-scrollbar"
  use "ggandor/leap.nvim"
  use "karb94/neoscroll.nvim"
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  }
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  --[[ use { ]]
  --[[   "chrisgrieser/nvim-early-retirement", ]]
  --[[   config = function () require("early-retirement").setup() end, ]]
  --[[ } ]]

  -- Packer
  -- Colorschemes
  --[[ use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out ]]
  --[[ use {"lunarvim/darkplus.nvim", commit = "b619b6317258b475b4770164c9784cf705560534"} ]]
  use 'folke/tokyonight.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  -- use {
  --   "tzachar/cmp-tabnine",
  --   config = function()
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine:setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --       run_on_every_keystroke = true,
  --       snippet_placeholder = "..",
  --       ignored_file_types = { -- default is not to ignore
  --         -- uncomment to ignore in lua:
  --         -- lua = true
  --       },
  --     }
  --   end,
  --
  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  -- }
  --
  -- -- use 'David-Kunz/cmp-npm' -- doesn't seem to work
  -- --use "rcarriga/cmp-dap"
  --

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use



  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use {
    "j-hui/fidget.nvim",
    commit = "99b306167d1d305ca084e3bb475d6eadf32a365b"
  } -- lsp progress bar
  use "onsails/lspkind-nvim"

  -- -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  --
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  -- Folding
  -- froze ufo because latest version does not respect treesitter fold queries
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', commit = "d99d72253ce615d66e41660f68255ff2f65b4cf8" }
  -- -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  --
  -- -- vim-test
  use "vim-test/vim-test"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
