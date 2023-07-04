-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
local autocmd = vim.api.nvim_create_autocmd
-- autocmd("VimEnter", {
--   pattern = "*",
--   command = "NvimTreeToggle"
-- })
-- autocmd("VimEnter", {
--   pattern = "*",
--   command = "Telescope oldfiles"
-- })

-- Changes for Nvim
vim.opt.colorcolumn = {"80", "100"}
vim.wo.relativenumber = true
-- incremental searches
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append('@-@')

vim.filetype.add {
  pattern = {
    [".*conf.template"] = "nginx",
  },
}
