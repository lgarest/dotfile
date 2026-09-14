-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader-rn>", "<cmd>!bun % <CR> NoiceAll <CR>", { desc = "Run current file with bun" })
map("n", "vgd", "<cmd> vsplit <CR>gd z<CR>", { desc = "go to definition in vsplit", remap = true })
map("n", "vgs", "<cmd> split <CR>gd z<CR>", { desc = "go to definition in split", remap = true })
map("n", "vgf", "<cmd> vsplit <CR>gf<CR>", { desc = "go to file in vsplit", remap = true })
map("n", "<Tab>", "]b", { desc = "go to next tab", remap = true })
map("n", "<S-Tab>", "[b", { desc = "go to previous tab", remap = true })
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "toggle file explorer" })

map("i", "jj", "<ESC>", { desc = "Exit insert mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

map("i", "<C-f>", "<cmd> silent !tmux neww ~/bin/tmux-sessionizer.sh<CR>", { desc = "tmux sessionizer" })
map("i", "<C-s>", "<cmd> silent !tmux neww ~/bin/tmux-fzf-session.sh<CR>", { desc = "tmux sessionizer" })

-- map("n", "vgf", "<cmd> vsplit <CR>gf<CR>", { desc = "go to file in vsplit", remap = true })
