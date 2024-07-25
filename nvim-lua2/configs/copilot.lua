local M = {}

M.toggle_copilot = function()
	local copilot = vim.g.copilot_enabled
	if copilot == nil then
		copilot = true
	end
	vim.g.copilot_enabled = not copilot
	print("Copilot is now " .. (vim.g.copilot_enabled and "enabled" or "disabled"))
end

vim.g.copilot_no_tab_map = true

return M

