local map = vim.keymap.set
local constants = require("core.constants")

-- File opening keymaps
map("n", "<leader>om", "<cmd> tabnew " .. constants.files.mappings .. " <CR>", { desc = "open [m]appings file" })
map("n", "<leader>on", "<cmd> tabnew " .. constants.paths.notes .. " <CR>", { desc = "open [n]otes file" })
map("n", "<leader>oh", "<cmd> tabnew " .. constants.files.vim_cheatsheet .. " <CR>", { desc = "open vim c[h]eatsheet" })
map("n", "<leader>ot", "<cmd> tabnew " .. constants.files.telescope_cheatsheet .. " <CR>", { desc = "open [t]elescope cheatsheet" })
map("n", "<leader>o,", "<cmd> tabnew " .. constants.files.plugins .. " <CR>", { desc = "open plugins file" })
map("n", "<leader>op", "<cmd> tabnew " .. constants.files.plugins .. " <CR>", { desc = "open [p]lugins file" })
map("n", "<leader>ob", "<cmd> tabnew " .. constants.files.biome_config .. " <CR>", { desc = "open [b]iome config" })
