local M = {}

-- Set indentation level
M.set_indentation = function(level)
  vim.o.shiftwidth = level
  vim.o.softtabstop = level
  vim.o.tabstop = level
end

-- Set up TreeSitter folding with error handling
M.setup_treesitter_folding = function()
  local ok, ts = pcall(require, 'nvim-treesitter')
  if ok and ts then
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldlevel = 20
    vim.opt.foldcolumn = "auto"
  else
    -- Fallback to manual folding if TreeSitter is not available
    vim.opt.foldmethod = "manual"
    vim.opt.foldlevel = 99
  end
end

-- Toggle theme function
M.toggle_theme = function()
  require("base46").toggle_theme()
end

-- Make theme function global for backward compatibility
_G.ToggleTheme = M.toggle_theme

-- Lazy load telescope extensions
M.setup_telescope_extensions = function()
  vim.defer_fn(function()
    local ok, telescope = pcall(require, "telescope")
    if ok then
      telescope.load_extension("fzf")
    end
  end, 100)
end

-- NvimTree utility functions
local VIEW_WIDTH_FIXED = 30
local VIEW_WIDTH_MAX = -1 -- fixed to start

M.toggle_width_adaptive = function()
  if VIEW_WIDTH_MAX == -1 then
    VIEW_WIDTH_MAX = VIEW_WIDTH_FIXED
  else
    VIEW_WIDTH_MAX = -1
  end
  require("nvim-tree.api").tree.reload()
end

M.get_view_width_max = function()
  return VIEW_WIDTH_MAX
end

-- Make functions global for backward compatibility
_G.toggle_width_adaptive = M.toggle_width_adaptive
_G.get_view_width_max = M.get_view_width_max

return M
