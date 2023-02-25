--[[ vim.cmd [[ ]]
--[[   augroup _general_settings ]]
--[[     autocmd! ]]
--[[     autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>  ]]
--[[     autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})  ]]
--[[     autocmd BufWinEnter * :set formatoptions-=cro ]]
--[[     autocmd FileType qf set nobuflisted ]]
--[[   augroup end ]]
--[[]]
--[[   augroup _git ]]
--[[     autocmd! ]]
--[[     autocmd FileType gitcommit setlocal wrap ]]
--[[     autocmd FileType gitcommit setlocal spell ]]
--[[   augroup end ]]
--[[]]
--[[   augroup _markdown ]]
--[[     autocmd! ]]
--[[     autocmd FileType markdown setlocal wrap ]]
--[[     autocmd FileType markdown setlocal spell ]]
--[[   augroup end ]]
--[[]]
--[[   augroup _auto_resize ]]
--[[     autocmd! ]]
--[[     autocmd VimResized * tabdo wincmd =  ]]
--[[   augroup end ]]
--[[]]
--[[   augroup _alpha ]]
--[[     autocmd! ]]
--[[     autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2 ]]
--[[   augroup end ]]
--[[ ]] 

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
--
local copy_import_statement = function()
	local file_name = vim.fn.expand("%:~:.")
	local module_name = file_name:gsub(".py", ""):gsub("/", ".")
	local symbol_name = vim.fn.expand("<cword>")
	local import_statement = "from " .. module_name .. " import " .. symbol_name
	vim.api.nvim_command("let @+ = '" .. import_statement .. "'")
end
local copy_symbol_path = function()
	local file_name = vim.fn.expand("%:~:.")
	local module_name = file_name:gsub(".py", ""):gsub("/", ".")
	local symbol_name = vim.fn.expand("<cword>")
	local symbol_path = module_name .. "." .. symbol_name
	vim.api.nvim_command("let @+ = '" .. symbol_path .. "'")
end
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		vim.keymap.set("n", "<leader>ys", copy_import_statement)
		vim.keymap.set("n", "<leader>yp", copy_symbol_path)
	end,
})
