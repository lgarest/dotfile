local M = {}

-- Track if copilot is enabled (starts as enabled by default)
local copilot_enabled = true

M.toggle_copilot = function()
	-- Check if copilot is loaded
	local copilot_ok, copilot = pcall(require, "copilot")
	if not copilot_ok then
		vim.notify("Copilot plugin not found", vim.log.levels.ERROR)
		return
	end

	-- Check if copilot.suggestion module exists
	local suggestion_ok, suggestion = pcall(require, "copilot.suggestion")
	if not suggestion_ok then
		vim.notify("Copilot suggestion module not found", vim.log.levels.ERROR)
		return
	end

	-- Toggle state
	if copilot_enabled then
		-- Disable copilot
		copilot_enabled = false
		-- Dismiss any current suggestions
		suggestion.dismiss()
		-- Use vim command to disable
		vim.cmd("Copilot disable")
		vim.notify("Copilot disabled", vim.log.levels.INFO)
	else
		-- Enable copilot
		copilot_enabled = true
		-- Use vim command to enable
		vim.cmd("Copilot enable")
		vim.notify("Copilot enabled", vim.log.levels.INFO)
	end
end

M.copilot_status = function()
	print("Copilot is " .. (copilot_enabled and "enabled" or "disabled"))
	return copilot_enabled
end

M.is_enabled = function()
	return copilot_enabled
end

vim.g.copilot_no_tab_map = true

return M

