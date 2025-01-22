require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("VimEnter", {
--   pattern = "*",
--   command = "NvimTreeToggle"
-- })
-- autocmd("VimEnter", {
--   pattern = "*",
--   command = "Telescope oldfiles"
-- })

-- Changes for Nvim
vim.opt.cursorlineopt = "both" -- to enable cursorline!
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
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 20
vim.opt.foldcolumn = "auto"

-- @TODO: change for this
-- local optionss = {
--   swapfile = false, -- no swapfile
--   switchbuf = "vsplit", -- switch to vertical split
--   splitbelow = true, -- split below
--   splitright = true, -- split right
--   winbar = "%=%m %f", -- show modified and filename
--   mousescroll = "ver:1,hor:2", -- mouse scroll
--   scrolloff = 8, -- lines of context
--   incsearch = true, -- incremental searches
--   colorcolumn = "80,100", -- colorcolumn at 80 and 100
--   relativenumber = true, -- relative line numbers
--   isfname = vim.o.isfname .. "@-@", -- allow @ in filenames
--   cursorlineopt = "both", -- enable cursorline
-- }
--
-- for k, v in pairs(optionss) do
--   vim.opt[k] = v
-- end

-- vim.g.snipmate_snippets_path = "~/dev/dotfile/snippets/"
-- vim.g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/my_snippets"
vim.g.vscode_snippets_path = "~/personal/dotfile/my_snippets"
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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.g.have_nerd_font = true

vim.cmd([[
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
    cnoreabbrev XA xa
    cnoreabbrev Xa xa
    cnoreabbrev Vs vs
    cnoreabbrev VS vs
    cnoreabbrev vS vs
    cnoreabbrev Ack Ack!
    cnoreabbrev LAzy Lazy
    command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
]])
