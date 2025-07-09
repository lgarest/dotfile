require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Remove unused inherited default mappings
nomap("n", "<leader>rn") -- remove toggle relative number
nomap("n", "<C-s>") -- remove save (collides with sessionizer)
nomap("n", "<leader>n") -- remove toggle relative number
nomap({ "n", "v" }, "<leader>/") -- remove toggle comment
nomap("n", "<leader>cm") -- remove Telescope git_commits <CR>
nomap("n", "<leader>fo") -- remove Telescope find_old <CR>
nomap("n", "<C-n>") -- remove nvimtree toggle
nomap("n", "<leader>h") -- remove terminal new horizontal term
nomap("n", "<leader>v") -- remove terminal new vertical term
nomap("n", "<A-v>") -- remove terminal toggleable vertical term
nomap("n", "<A-h>") -- remove terminal new horizontal term
nomap("n", "<leader>e") -- remove focus treesitter diagnostics for current file

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map(
	"n",
	"<leader>cbp",
	"<cmd> lua vim.fn.setreg('+', vim.fn.expand('%:p')) <CR>",
	{ desc = "Copy [b]uffer [p]ath to clipboard" }
)
-- option in macos
map("n", "<A-y>", function()
	print("Opt-y")
end, { desc = "testing" })

-- IDE capabilities
map("n", "gs", "<cmd> split <CR>gd z<CR>", { desc = "goto definition in [s]plit", remap = true })
map("n", "gv", "<cmd> vsplit <CR>gd z<CR>", { desc = "goto definition in [v]split", remap = true })
map("n", "gF", "<cmd> vsplit <CR>gf", { desc = "goto [F]ile in vsplit", remap = true })
map("n", "<leader>os", function()
	vim.cmd("vsplit")
	require("luasnip.loaders").edit_snippet_files()
end, { desc = "open [s]nippet files" })
-- -- Add binding for lsp code_action
-- map("n", "<leader>ca", function()
--   local params = vim.lsp.util.make_range_params()
--   params.context = { diagnostics = {}, only = { "quickfix" } }
--   
--   vim.lsp.buf.code_action(params, {
--     filter = function(action)
--       return action.kind == "quickfix"
--     end,
--   })
-- end, { desc = "Code [a]ction" })

map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code [a]ction" })
map("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", { desc = "Code [a]ction" })

-- vim.api.nvim_buf_set_keymap(bufnr, "n", '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--    vim.api.nvim_buf_set_keymap(bufnr, "v", '<space>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

-- Opening specific files
map("n", "<leader>om", "<cmd> tabnew ~/.config/nvim/lua/mappings.lua <CR>", { desc = "open [m]appings file" })
map("n", "<leader>on", "<cmd> tabnew ~/personal/notes/ <CR>", { desc = "open [n]otes file" })
map("n", "<leader>oh", "<cmd> tabnew ~/personal/notes/vim.md <CR>", { desc = "open vim c[h]eatsheet" })
map("n", "<leader>ot", "<cmd> tabnew ~/personal/notes/telescope.md <CR>", { desc = "open [t]elescope cheatsheet" })
map("n", "<leader>o,", "<cmd> tabnew ~/.config/nvim/lua/plugins/init.lua <CR>", { desc = "open plugins file" })
map("n", "<leader>op", "<cmd> tabnew ~/.config/nvim/lua/plugins/init.lua <CR>", { desc = "open [p]lugins file" })
map("n", "<leader>ob", "<cmd> tabnew ~/personal/dotfile/biome.json <CR>", { desc = "open [b]iome config" })

-- Toggle UI
map("n", "<leader>tr", "<cmd>set rnu!<cr>", { desc = "Toggle [r]elative number" })
map("n", "<leader>ts", "<cmd> set spell! <CR>", { desc = "Toggle [s]pell!" })

-- Openings
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "[t]ab[n]ew" })
map("n", "<leader>ol", "<cmd> Lazy <CR>", { desc = "open [l]azy" })

-- Git / fugitive
map("n", "<leader>gb", "<cmd> G blame<CR>", { desc = "git [b]lame" })
map("n", "<leader>gd", "<cmd> Gvdiffsplit<CR>", { desc = "git [d]iff" })
map("n", "<leader>gp", "<cmd> Gitsigns preview_hunk<CR>", { desc = "git [p]review hunk" })
map("v", "gh", "<cmd> diffget //2 <CR>", { desc = "Pick left in conflicts solver" })
map("v", "gl", "<cmd> diffget //3 <CR>", { desc = "Pick right in conflicts solver" })
-- map("n", "<leader>gg", function()
-- 	vim.cmd("tab G")
-- 	vim.cmd("h fugitive-staging-maps")
-- 	vim.cmd("wincmd L")
-- 	vim.cmd("wincmd h")
-- end, { desc = "Open fugitive status / goto [g]it" })
-- map("n", "<leader>gl", "<cmd> Git log -- %<CR>", { desc = "git [l]og" })

-- Telescope
map(
	"n",
	"<leader>of",
	"<cmd> Telescope lsp_document_symbols symbols={'function'} symbol_width=70<CR>",
	{ desc = "Outline [f]unctions" }
)
map(
	"n",
	"<leader>oF",
	"<cmd> Telescope lsp_dynamic_workspace_symbols symbols={'function','constant'} fname_width=54<CR>",
	{ desc = "Outline workspace [f]unctions" }
)
-- map("n", "<C-p>", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" })
map("n", "<leader>f.", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h/..") })
end, { desc = "Find files in current parent directory" })
map("n", "<leader>fB", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "fzf find in current [B]uffer" })
map("n", "<leader>fM", "<cmd> Telescope marks <CR>", { desc = "find [M]arks" })
map("n", "<leader>fc", "<cmd> Telescope grep_string<CR>", { desc = "find [c]urrent word" })
map("v", "<leader>fc", function()
	local term = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), { mode = vim.fn.mode() })
	require("telescope.builtin").live_grep({ default_text = table.concat(term) })
end, { desc = "Search/find [c]urrent selection" })
map("n", "<leader>fC", "<cmd> Telescope commands <CR>", { desc = "find [C]ommands" })
map("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>", { desc = "find [d]iagnostics" })
map("n", "<leader>fk", "<cmd> Telescope keymaps <CR>", { desc = "find [k]eymaps" })
map("n", "<leader>fl", ":Telescope live_grep search_dirs=", { desc = "find in fo[l]der" })
map("n", "<leader>fn", function()
	require("telescope.builtin").find_files({ cwd = "~/personal/dotfile/nvim-lua2/" })
end, { desc = "[S]earch [N]eovim files" })
map("n", "<leader>fo", "<cmd> Telescope frecency workspace=CWD<CR>", { desc = "find [o]ld files" })
map("n", "<leader>fr", "<cmd> Telescope resume <CR>", { desc = "resume previous Telescope [f]ind" })
map("n", "<leader>fR", "<cmd> Telescope registers <CR>", { desc = "Search/find r[e]gisters" })
map("n", "<leader>ft", "<cmd>Telescope grep_string search=@TODO<CR>", { desc = "find [t]odos" })
map("n", "<leader>go", "<cmd> Telescope git_branches<CR>", { desc = "git check[o]ut" })
map("n", "<leader>gr", "<cmd> Telescope lsp_references <CR>", { desc = "goto [r]eferences" })
map("n", "<leader>gs", "<cmd> Telescope git_status<CR>", { desc = "git [s]tatus" })

-- NvimTree
map("n", "\\e", "<cmd> NvimTreeFindFile! <CR>", { desc = "Find file in nvimtree [e]xplorer" })
-- map("n", "\\e", "<cmd> NvimTreeFindFileToggle <CR>", { desc = "Find file in nvimtree [e]xplorer" })
map("n", "\\n", "<cmd> NvimTreeToggle <CR>", { desc = "Open/Close nvimtree" })
map("n", "<leader>ta", function()
	toggle_width_adaptive()
	print("Toggled NvimTree adaptive width. Current width value: ", get_view_width_max())
end, { desc = "Toggle Nvimtree adaptive width" })

-- Leap
map("n", "gw", function()
	require("leap").leap({ target_windows = require("leap.util").get_enterable_windows() })
end, { desc = "Jump in window" })

-- Executions/Runners
map("n", "<leader>xx", ":. !sh <CR>", { desc = "execute current command inline" })
map("n", "<leader>rn", function()
	vim.cmd("! bun %")
end, { desc = "execute current buffer through [n]ode repl (TS)" })
map("n", "<leader>rp", function()
	vim.cmd("w!")
	vim.cmd("silent !biome format --write --config-path='/Users/lgarciae/personal/dotfile/biome.json' '%'")
	-- vim.cmd("!prettier --write --config-path='/Users/lgarciae/personal/dotfile/prettierrc' %")
end, { desc = "make current buffer [p]retty" })
map("n", "<leader>rP", function()
	vim.cmd("w!")
	vim.cmd("!biome format --write --config-path='/Users/lgarciae/personal/dotfile/biome.good.json' '%'")
	-- vim.cmd("!prettier --write --config-path='/Users/lgarciae/personal/dotfile/prettierrc' %")
end, { desc = "make current buffer super [P]retty" })
map("n", "<leader>re", function()
	vim.cmd("!biome lint --config-path=/Users/lgarciae/personal/dotfile/biome.json --write '%'")
end, { desc = "run [e]slint over current buffer" })

-- Tmux navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "Window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "Window right" })
map("n", "<C-f>", "<cmd> silent !tmux neww ~/bin/tmux-sessionizer.sh <CR>")
map("n", "<C-s>", "<cmd> silent !tmux neww ~/bin/tmux-fzf-session.sh <CR>")

-- Treesitter context
map("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Go to [c]ontext" })

-- Copilot chat
map("n", "<leader>ccp", "<cmd> CopilotChatPrompts <CR>", { desc = "Open [c]opilot [p]rompts" })
map("v", "<leader>ccp", "<cmd> CopilotChatPrompts <CR>", { desc = "[Visual] Open [c]opilot [p]rompts" })
map("n", "<leader>cco", "<cmd> CopilotChat <CR>", { desc = "Open [c]opilot [c]hat" })
map("v", "<leader>cco", "<cmd> CopilotChat <CR>", { desc = "[Visual] Open [c]opilot [c]hat" })

--
map("n", "<leader>fg", "<cmd> GrugFar <CR>", { desc = "find with [g]rug" })
