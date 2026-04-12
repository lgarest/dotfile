local nomap = vim.keymap.del

-- Remove unused inherited default mappings
nomap("n", "<leader>rn")          -- remove toggle relative number            -> tr
nomap("n", "<C-s>")               -- remove save (collides with sessionizer)  -> :w
nomap("n", "<leader>n")           -- remove toggle relative number
nomap({ "n", "v" }, "<leader>/")  -- remove toggle comment
nomap("n", "<leader>cm")          -- remove Telescope git_commits <CR>
nomap("n", "<leader>fo")          -- remove Telescope find_old <CR>
nomap("n", "<C-n>")               -- remove nvimtree toggle
nomap("n", "<leader>h")           -- remove terminal new horizontal term
nomap("n", "<leader>v")           -- remove terminal new vertical term
nomap("n", "<A-v>")               -- remove terminal toggleable vertical term
nomap("n", "<A-h>")               -- remove terminal new horizontal term
nomap("n", "<leader>e")           -- remove focus treesitter diagnostics for current file
