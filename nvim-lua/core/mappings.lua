-- Load NvChad default mappings first
require("nvchad.mappings")

-- Remove conflicting default mappings
require("core.keymaps_reset")

-- Load organized keymap categories
require("core.keymaps.general")
require("core.keymaps.telescope")
require("core.keymaps.lsp")
require("core.keymaps.git")
require("core.keymaps.files")
require("core.keymaps.tools")
