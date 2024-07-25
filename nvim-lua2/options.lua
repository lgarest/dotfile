require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
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
vim.opt.mousescroll = { "ver:1", "hor:2" }
vim.opt.isfname:append("@-@")

vim.filetype.add({
	pattern = {
		[".*conf.template"] = "nginx",
	},
})

vim.opt.winbar = "%=%m %f"

vim.opt.swapfile = false
vim.opt.switchbuf = "vsplit"

-- vim.g.snipmate_snippets_path = "~/dev/dotfile/snippets/"
vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/my_snippets"
-- vim.g.snipmate_snippets_path = "~/dev/dotfile/my_snippets"
--


-- @TODO clean this
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

-- set indentation to 2 spaces
local function set_indentation(level)
	vim.o.shiftwidth = level
	vim.o.softtabstop = level
	vim.o.tabstop = level
end
set_indentation(2)

-- vim.api.nvim_create_autocmd({ "VimEnter" , {
--   pattern = { "*.md" },
--   callback = function ()
--     set_indentation(2)
--   end
-- }})
-- move to setup fn for copilot
-- require("configs.copilot")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.g.have_nerd_font = true

vim.cmd [[
    cnoreabbrev W! w!
    cnoreabbrev W1 w!
    cnoreabbrev w1 w!
    cnoreabbrev Q! q!
    cnoreabbrev Qa! qa!
    cnoreabbrev QA! qa!
    cnoreabbrev qA! qa!
    cnoreabbrev Wa wa
    cnoreabbrev Wq wq
    cnoreabbrev Wqa wqa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
    cnoreabbrev QA qa
    cnoreabbrev qA qa
    cnoreabbrev Vs vs
    cnoreabbrev VS vs
    cnoreabbrev vS vs
    cnoreabbrev Ack Ack!
    command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
]]
