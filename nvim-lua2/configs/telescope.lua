local actions = require "telescope.actions"

-- local function normalize_path(path)
--   return path:gsub("\\", "/")
-- end
--
-- local function normalize_cwd()
--   return normalize_path(vim.loop.cwd()) .. "/"
-- end
--
-- local function is_subdirectory(cwd, path)
--   return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
-- end
--
-- local function split_filepath(path)
--   local normalized_path = normalize_path(path)
--   local normalized_cwd = normalize_cwd()
--   local filename = normalized_path:match("[^/]+$")
--
--   if is_subdirectory(normalized_cwd, normalized_path) then
--     local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
--     return stripped_path, filename
--   else
--     local stripped_path = normalized_path:sub(1, -(#filename + 1))
--     return stripped_path, filename
--   end
-- end
--
-- local function path_display(_, path)
--   local stripped_path, filename = split_filepath(path)
--   if filename == stripped_path or stripped_path == "" then
--     return filename
--   end
--   return string.format("%s ~ %s", filename, stripped_path)
-- end


require("telescope").setup {
  defaults={
    path_display = {
      shorten = { len = 4, exclude = { 1, -1 } },
    }
    -- path_display = function(_, path)
    --   local tail = require("telescope.utils").path_tail(path)
    --   return string.format("%s (%s)", tail, path)
    -- end,
    -- path_display = path_display,
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  },
  extensions = {
    frecency = {
      auto_validate = false,
      matcher = "fuzzy",
      -- show_scores = true,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      -- workspaces = {
        -- ["conf"] = "/home/username/.config",
        -- ["proj"] = "/home/username/projects",
      -- }
    }
  }
}
