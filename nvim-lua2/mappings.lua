require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

-- treesitter
map("n", "<leader>e", "", { desc = "remove focus treesitter diagnostics for current file" })

map(
	"n",
	"<leader>fs",
	"<cmd> Telescope treesitter ignore_symbols={'import'}<CR>",
	{ desc = "Open/find treesitter [s]ymbols" }
)
map(
	"n",
	"<leader>fS",
	"<cmd> Telescope lsp_dynamic_workspace_symbols ignore_symbols={'import'}<CR>",
	{ desc = "Open/find treesitter [s]ymbols" }
)

-- Remove unused default mappings
nomap("n", "<leader>rn") -- remove toggle relative number
nomap("n", "<C-s>") -- remove save (collides with sessionizer)
nomap("n", "<leader>n") -- remove toggle relative number
nomap({ "n", "v" }, "<leader>/") -- remove toggle comment
nomap("n", "<leader>cm") -- remove Telescope git_commits <CR>
nomap("n", "<C-n>") -- remove nvimtree toggle
nomap("n", "<leader>h") -- remove terminal new horizontal term
nomap("n", "<leader>v") -- remove terminal new vertical term
nomap("n", "<A-v>") -- remove terminal toggleable vertical term
nomap("n", "<A-h>") -- remove terminal new horizontal term

-- General

map("n", "gs", "<cmd> split <CR>gd z<CR>", { desc = "goto definition in [s]plit", remap = true })
map("n", "gv", "<cmd> vsplit <CR>gd z<CR>", { desc = "goto definition in [v]split", remap = true })
map("n", "gF", "<cmd> vsplit <CR>gf", { desc = "goto [F]ile in vsplit", remap = true })
map("n", "<leader>os", function()
	vim.cmd("vsplit")
	require("luasnip.loaders").edit_snippet_files()
end, { desc = "open [s]nippet files" })
map("n", "<leader>om", "<cmd> tabnew ~/.config/nvim/lua/mappings.lua <CR>", { desc = "open [m]appings file" })
map("n", "<leader>on", "<cmd> tabnew ~/personal/notes/ <CR>", { desc = "open [n]otes file" })
map("n", "<leader>oh", "<cmd> tabnew ~/personal/notes/vim.md <CR>", { desc = "open vim c[h]eatsheet" })
map("n", "<leader>ot", "<cmd> tabnew ~/personal/notes/telescope.md <CR>", { desc = "open [t]elescope cheatsheet" })
map("n", "<leader>o,", "<cmd> tabnew ~/.config/nvim/lua/plugins/init.lua <CR>", { desc = "open plugins file" })
map("n", "<leader>op", "<cmd> tabnew ~/.config/nvim/lua/plugins/init.lua <CR>", { desc = "open [p]lugins file" })

-- Toggles
map("n", "<leader>tr", "<cmd>set rnu!<cr>", { desc = "[t]oggle [r]elative number" })
map("n", "<leader>ts", "<cmd> set spell! <CR>", { desc = "set [s]pell!" })

-- Git / fugitive
map("n", "<leader>gg", function()
	vim.cmd("tab G")
	vim.cmd("h fugitive-staging-maps")
	vim.cmd("wincmd L")
	vim.cmd("wincmd h")
end, { desc = "Open fugitive status / goto [g]it" })
map("n", "<leader>gl", "<cmd> GV!<CR>", { desc = "git [)l]og" })
map("n", "<leader>gb", "<cmd> G blame<CR>", { desc = "git [)b]lame" })
map("n", "<leader>gp", "<cmd> Gitsigns preview_hunk<CR>")
map("v", "gh", "<cmd> diffget //2 <CR>")
map("v", "gl", "<cmd> diffget //3 <CR>")

-- Telescope
map("n", "<leader>fB", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "fzf find in current [B]uffer" })
map("n", "<leader>fc", "<cmd> Telescope grep_string <CR>", { desc = "Search/find [c]urrent word" })
map("n", "<leader>fC", "<cmd> Telescope commands <CR>", { desc = "Search/find [C]ommands" })
map("n", "<leader>fM", "<cmd> Telescope marks <CR>", { desc = "find [M]arks" })
map("n", "<leader>fr", "<cmd> Telescope resume <CR>", { desc = "resume previous Telescope [f]ind" })
map("n", "<leader>fR", "<cmd> Telescope registers <CR>", { desc = "Search/find r[e]gisters" })
map("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>", { desc = "find [d]iagnostics" })

map("n", "<leader>fk", "<cmd> Telescope keymaps <CR>", { desc = "Search/find [k]eymaps" })
map("n", "<leader>fl", ":Telescope live_grep search_dirs=./", { desc = "Search/find in fo[l]der" })
map("n", "<leader>ft", "<cmd>Telescope grep_string search=@TODO<CR>", { desc = "find [t]odos" })
map("n", "<leader>gr", "<cmd> Telescope lsp_references <CR>", { desc = "goto [r]eferences" })
map("n", "<leader>gs", "<cmd> Telescope git_status<CR>", { desc = "git [s]tatus" })
map("n", "<leader>go", "<cmd> Telescope git_branches<CR>", { desc = "git check[o]ut" })
map("n", "<C-p>", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" })
map("n", "<leader>fn", function()
	require("telescope.builtin").find_files({ cwd = "~/personal/dotfile/nvim-lua2/" })
end, { desc = "[S]earch [N]eovim files" })

-- NvimTree
map("n", "\\e", "<cmd> NvimTreeFindFile! <CR>", { desc = "Find file in nvimtree [e]xplorer" })
map("n", "\\n", "<cmd> NvimTreeToggle <CR>", { desc = "Open/Close nvimtree" })

-- Leap
map("n", "gw", function()
	require("leap").leap({ target_windows = require("leap.util").get_enterable_windows() })
end, { desc = "Jump in window" })

-- Runners
map("n", "<leader>rp", function()
	vim.cmd("w!")
	vim.cmd("!biome format --write --config-path='/Users/lgarciae/dev/dotfile/biome.json' %")
end, { desc = "run current buffer through [p]rettier" })
map("n", "<leader>rn", function()
	vim.cmd("! bun %")
end, { desc = "run current buffer through [n]ode repl (TS)" })
map("n", "<leader>re", function()
	vim.cmd("!$(which biome) lint --config-path=/Users/lgarciae/dev/dotfile/biome.json --apply %")
end, { desc = "run current buffer through biom[e]" })

map("n", "<leader>xx", ":. !sh <CR>", { desc = "execute current command inline" })

-- Tmux navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "Window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "Window right" })
    map("n", "<C-f>", "<cmd> silent !tmux neww tmux-sessionizer.sh <CR>" )
    map("n", "<C-s>", "<cmd> silent !tmux neww tmux-fzf-session.sh <CR>" )

-- Copilot
map("i", "<C-y>", 'copilot#Accept("<CR>")', {
	expr = true,
	replace_keycodes = false,
})

-- ^imap^[lcs])a"n", ^[Bel%ct"<80><fd>5, ^[f,<80><fd>5a {desc=^[A)^[j
