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
vim.opt.colorcolumn = { "80", "100" }
vim.wo.relativenumber = true
-- incremental searches
vim.opt.incsearch = true

vim.opt.scrolloff = 8

-- mousescroll=ver:5,hor:2
vim.opt.mousescroll = {'ver:1','hor:2'}
vim.opt.isfname:append("@-@")

vim.filetype.add({
	pattern = {
		[".*conf.template"] = "nginx",
	},
})

vim.opt.winbar='%=%m %f'

vim.opt.swapfile = false

-- vim.g.snipmate_snippets_path = "~/dev/dotfile/snippets/"
vim.g.vscode_snippets_path="~/dev/dotfile/my_snippets/"
-- vim.g.snipmate_snippets_path = "~/dev/dotfile/my_snippets/"
--

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
