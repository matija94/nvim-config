local status_ok, conform = pcall(require, "conform")
if not status_ok then
	return
end

conform.setup({
	-- Define your formatters
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black", "ruff" },
		javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
		sh = { "shfmt" },
    go = { "golines" },
	},
	-- Set up format-on-save
	-- format_on_save = { timeout_ms = 500, lsp_fallback = true },
	-- Customize formatters
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})
