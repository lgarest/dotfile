local map = vim.keymap.set
local constants = require("core.constants")

-- Telescope keymaps
map("n", "<leader>of", "<cmd> Telescope lsp_document_symbols symbols={'function'} symbol_width=70<CR>", { desc = "Outline [f]unctions" })
map("n", "<leader>oF", "<cmd> Telescope lsp_dynamic_workspace_symbols symbols={'function','constant'} fname_width=54<CR>", { desc = "Outline workspace [f]unctions" })

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
  require("telescope.builtin").find_files({ cwd = constants.paths.nvim_config })
end, { desc = "[S]earch [N]eovim files" })

map("n", "<leader>fo", "<cmd> Telescope frecency workspace=CWD<CR>", { desc = "find [o]ld files" })
map("n", "<leader>fr", "<cmd> Telescope resume <CR>", { desc = "resume previous Telescope [f]ind" })
map("n", "<leader>fR", "<cmd> Telescope registers <CR>", { desc = "Search/find r[e]gisters" })
map("n", "<leader>ft", "<cmd>Telescope grep_string search=@TODO<CR>", { desc = "find [t]odos" })

-- Git telescope
map("n", "<leader>go", "<cmd> Telescope git_branches<CR>", { desc = "git check[o]ut" })
map("n", "<leader>gr", "<cmd> Telescope lsp_references <CR>", { desc = "goto [r]eferences" })
map("n", "<leader>gs", "<cmd> Telescope git_status<CR>", { desc = "git [s]tatus" })

-- Grug far
map("n", "<leader>fg", "<cmd> GrugFar <CR>", { desc = "find with [g]rug" })
