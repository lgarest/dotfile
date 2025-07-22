---@type NvPluginSpec[]
-- Plugin categories are organized in separate files for better maintainability
-- Load utility functions to make them available globally
require("core.utils")

-- Import plugin categories
local function merge_plugins(...)
  local result = {}
  for _, plugin_list in ipairs({...}) do
    for _, plugin in ipairs(plugin_list) do
      table.insert(result, plugin)
    end
  end
  return result
end

local plugins = merge_plugins(
  require("plugins.lsp"),
  require("plugins.editor"),
  require("plugins.git"),
  require("plugins.completion"),
  require("plugins.language"),
  require("plugins.ui")
)

return plugins
