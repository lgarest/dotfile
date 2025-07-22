local map = vim.keymap.set
local constants = require("core.constants")

-- NvimTree
map("n", "\\e", "<cmd> NvimTreeFindFile! <CR>", { desc = "Find file in nvimtree [e]xplorer" })
map("n", "\\n", "<cmd> NvimTreeToggle <CR>", { desc = "Open/Close nvimtree" })
map("n", "<leader>ta", function()
  toggle_width_adaptive()
  print("Toggled NvimTree adaptive width. Current width value: ", get_view_width_max())
end, { desc = "Toggle Nvimtree [a]daptive width" })

-- Leap motion
map("n", "gw", function()
  require("leap").leap({ target_windows = require("leap.util").get_enterable_windows() })
end, { desc = "Jump in window" })

-- Executions/Runners
map("n", "<leader>rx", ":. !sh <CR>", { desc = "execute current command inline" })
map("n", "<leader>rn", function()
  vim.cmd("! bun %")
end, { desc = "execute current buffer through [n]ode repl (TS)" })

map("n", "<leader>rp", function()
  vim.cmd("w!")
  vim.cmd("silent !biome format --write --config-path='" .. constants.paths.biome_config .. "' '%'")
end, { desc = "make current buffer [p]retty" })

map("n", "<leader>rP", function()
  vim.cmd("w!")
  vim.cmd("!biome format --write --config-path='" .. constants.paths.biome_good_config .. "' '%'")
end, { desc = "make current buffer super [P]retty" })

map("n", "<leader>re", function()
  vim.cmd("!biome lint --config-path=" .. constants.paths.biome_config .. " --write '%'")
end, { desc = "run [e]slint over current buffer" })

-- Tmux navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "Window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "Window right" })
map("n", "<C-f>", "<cmd> silent !tmux neww " .. constants.paths.tmux_sessionizer .. " <CR>")
map("n", "<C-s>", "<cmd> silent !tmux neww " .. constants.paths.tmux_fzf_session .. " <CR>")

-- Copilot
map("n", "<leader>cct", function()
  require("configs.copilot").toggle_copilot()
end, { desc = "Toggle copilot" })

map("n", "<leader>ccs", function()
  require("configs.copilot").copilot_status()
end, { desc = "Copilot [s]tatus" })

-- Copilot chat
map("n", "<leader>ccp", "<cmd> CopilotChatPrompts <CR>", { desc = "Open [c]opilot [p]rompts" })
map("v", "<leader>ccp", "<cmd> CopilotChatPrompts <CR>", { desc = "[Visual] Open [c]opilot [p]rompts" })
map("n", "<leader>cco", "<cmd> CopilotChat <CR>", { desc = "Open [c]opilot [c]hat" })
map("v", "<leader>cco", "<cmd> CopilotChat <CR>", { desc = "[Visual] Open [c]opilot [c]hat" })
