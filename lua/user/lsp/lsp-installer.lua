local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local servers = {
  "cssls",
  -- "cssmodules_ls",
  -- "emmet_ls",
  "html",
  -- "jdtls",
  -- "jsonls",
  -- "solc",
  "lua_ls",
  "buf-language-server",
  "buf",
  -- "tflint",
  "tsserver",
  "pyright",
  "gopls",
  --"pylance",
}

local settings = {
  ensure_installed = servers,
  -- automatic_installation = true,
  ui = {
    icons = {
      -- server_installed = "◍",
      -- server_pending = "◍",
      -- server_uninstalled = "◍",
      -- server_installed = "✓",
      -- server_pending = "➜",
      -- server_uninstalled = "✗",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },

  log_level = vim.log.levels.ERROR,
  -- max_concurrent_installers = 4,
  -- install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" },
}
mason.setup(settings)
--[[ mason_lspconfig.setup(settings) ]]

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}
for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "jsonls" then
    local jsonls_opts = require "user.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "lua_ls" then
    local lua_opts = require "user.lsp.settings.lua_ls"
    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "pylance" then
    local pylance_opts = require "user.lsp.settings.pylance"
    opts = vim.tbl_deep_extend("force", pylance_opts, opts)
  end

  lspconfig[server].setup(opts)
end
