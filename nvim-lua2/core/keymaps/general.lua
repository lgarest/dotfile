local map = vim.keymap.set

-- General editing commands
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "<leader>s", ":sort<CR>", { desc = "Sort selection" })
map("v", "<leader>S", ":sort!<CR>", { desc = "Sort selection in reverse" })

-- Copy buffer path
map("n", "<leader>cbp", function()
	local file_path = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()
	local relative_path = string.sub(file_path, #cwd + 2)
	vim.fn.setreg("+", relative_path)
	print("Copied buffer file path: " .. relative_path)
end, { desc = "Copy [b]uffer [p]ath to clipboard" })
map("n", "<leader>cba", function()
	-- local file_path = vim.fn.expand("%:p")
	-- vim.fn.setreg("+", file_path)
	local file_path = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()
	local relative_path = string.sub(file_path, #cwd + 1)
	vim.fn.setreg("+", relative_path)
	print("Copied buffer file path: " .. relative_path)
end, { desc = "Copy [b]uffer [a]bsolute path to clipboard" })

-- IDE capabilities
map("n", "gs", "<cmd> split <CR>gd z<CR>", { desc = "goto definition in [s]plit", remap = true })
map("n", "gv", "<cmd> vsplit <CR>gd z<CR>", { desc = "goto definition in [v]split", remap = true })
map("n", "gF", "<cmd> vsplit <CR>gf", { desc = "goto [F]ile in vsplit", remap = true })

-- Snippet files
map("n", "<leader>os", function()
	vim.cmd("vsplit")
	require("luasnip.loaders").edit_snippet_files()
end, { desc = "open [s]nippet files" })

-- Toggle UI
map("n", "<leader>tr", "<cmd>set rnu!<cr>", { desc = "Toggle [r]elative number" })
map("n", "<leader>ts", "<cmd> set spell! <CR>", { desc = "Toggle [s]pell!" })
map("n", "<leader>tt", "<cmd> lua ToggleTheme()<CR>", { desc = "Toggle [t]heme" })

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "tab[n]ew" })
map("n", "<C-n>", "<cmd>tabNext<CR>", { desc = "tabnext" })
map("n", "<C-p>", "<cmd>tabprevious<CR>", { desc = "tabprevious" })

-- Window management
map("n", "|", function ()
  if vim.t.zoomed and vim.t.zoomed == vim.fn.winnr() then
    vim.cmd("wincmd =")
    vim.t.zoomed = nil
  else
    vim.cmd("wincmd |")
    vim.t.zoomed = vim.fn.winnr()
  end
end, { desc = "Toggle window zoom" })

-- Open Lazy
map("n", "<leader>ol", "<cmd> Lazy <CR>", { desc = "open [l]azy" })
