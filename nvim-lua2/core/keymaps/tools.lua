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

-- map("n", "<leader>rp", function()
-- 	vim.cmd("w!")
-- 	vim.cmd("!biome format --write --config-path='/Users/lgarciae/personal/dotfile/biome.json' '%'")
-- end, { desc = "make current buffer [p]retty" })
local format = function(config)
	local _config = "~/personal/dotfile/biome.json"
	if config == "" then
		config = _config
	end

	local buf = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(buf)

	if filepath == "" then
		vim.notify("Buffer has no file path", vim.log.levels.WARN)
		return
	end

	vim.api.nvim_buf_call(buf, function()
		vim.cmd("write")
	end)

	local command = {
		"biome",
		"format",
		"--write",
		"--config-path=" .. vim.fn.expand(config),
		filepath,
	}
	-- text: (boolean) Handle stdout and stderr as text.
	-- cwd: (string) Set the current working directory for the sub-process.
	-- timeout: (integer) Run the command with a time limit.
	local _opts = { text = true, cwd = vim.fn.getcwd(), timeout = 1000 }

	local on_exit = function(result)
		if result.code == 0 then
			vim.schedule(function()
				vim.cmd("checktime") -- Reload buffer if changed externally
				vim.notify("Buffer formatted successfully", vim.log.levels.INFO)
			end)
		else
			vim.schedule(function()
				vim.notify("Biome format failed: " .. (result.stderr or "Unknown error"), vim.log.levels.ERROR)
			end)
		end
	end

	vim.system(command, _opts, on_exit) -- Run command asynchronously
end

map("n", "<leader>rb", function()
	format("~/personal/dotfile/biome.json")
end, { desc = "format with [b]iome" })

map("n", "<leader>rB", function()
	format("~/personal/dotfile/biome.good.json")
end, { desc = "format with [b]iome with my good config" })


map("n", "<leader>re", function()
	vim.cmd("!biome lint --config-path='/Users/lgarciae/personal/dotfile/biome.json' --write '%'")
end, { desc = "run [e]slint over current buffer" })

-- map("n", "<leader>rp", function()
-- 	vim.cmd("w!")
-- 	vim.cmd("!prettier --write --config-path='~/personal/dotfile/prettier' '%'")
-- end, { desc = "format with [p]rettier" })


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
map("n", "<leader>tc", function()
	require("configs.copilot").toggle_copilot()
end, { desc = "Toggle copilot" })

map("n", "<leader>ccs", function()
	require("configs.copilot").copilot_status()
end, { desc = "Copilot [s]tatus" })

-- Copilot chat
map({ "n", "v" }, "<leader>ccp", "<cmd> CopilotChatPrompts <CR>", { desc = "Open [c]opilot [p]rompts" })
map({ "n", "v" }, "<leader>cco", "<cmd> CopilotChat <CR>", { desc = "Open [c]opilot [c]hat" })

map({ "n", "v" }, "<leader>ccd", "<cmd> CopilotChatDocs <CR>", { desc = "Copilot [d]ocument code" })
map({ "n", "v" }, "<leader>cce", "<cmd> CopilotChatExplain <CR>", { desc = "Copilot [e]xplain code" })
map({ "n", "v" }, "<leader>ccf", "<cmd> CopilotChatFix <CR>", { desc = "Copilot [f]ix code" })
map({ "n", "v" }, "<leader>ccr", "<cmd> CopilotChatReview <CR>", { desc = "Copilot [r]eview code" })
map({ "n", "v" }, "<leader>cct", "<cmd> CopilotChatTests <CR>", { desc = "Copilot generate [t]ests" })
map({ "n", "v" }, "<leader>ccx", "<cmd> CopilotChatOptimize <CR>", { desc = "Copilot optimi[x]e code" })
map({ "n", "v" }, "<leader>ccc", "<cmd> CopilotChatCommit <CR>", { desc = "Copilot optimi[x]e code" })
map({ "n", "v" }, "<leader>ccg", "<cmd> CopilotChatGoodPractices <CR>", { desc = "Copilot [g]ood practices" })
