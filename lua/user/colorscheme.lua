-- set colorscheme after options
--[[ local colorscheme = "darkplus" ]]
--[[]]
--[[ local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) ]]
--[[ if not status_ok then ]]
--[[   vim.notify("colorscheme " .. colorscheme .. " not found!") ]]
--[[   return ]]
--[[ end ]]
vim.cmd[[colorscheme tokyonight-night]]
