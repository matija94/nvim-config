local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
local status_ok, query = pcall(require, "vim.treesitter.query")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "python", "lua", "javascript", "typescript", "dockerfile", "json", "yaml", "tsx" },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

local python_folds_query = [[
    [
      (function_definition)
      (class_definition)
      (import_from_statement)
    ] @fold
]]
local python_graphql_injection_query = [[
    (call
     function: ((identifier) @_name
       (#eq? @_name "gql"))
     arguments: (argument_list (string) @graphql
       (#offset! @graphql 0 3 0 -3)))
]]
local ecma_folds_query = [[
    [
      (arrow_function)
      (function)
      (function_declaration)
      (class_declaration)
      (method_definition)
      (import_statement)
      (object)
      (generator_function)
      (generator_function_declaration)
    ] @fold
]]
local go_folds_query = [[
  [
    (method_declaration)
    (function_declaration)
    (func_literal)
    (import_declaration)
    (type_declaration)
  ] @fold
]]

query.set_query("python", "folds", python_folds_query)
query.set_query("python", "injections", python_graphql_injection_query)
query.set_query("typescript", "folds", ecma_folds_query)
query.set_query("tsx", "folds", ecma_folds_query)
query.set_query("javascript", "folds", ecma_folds_query)
query.set_query("go", "folds", go_folds_query)
