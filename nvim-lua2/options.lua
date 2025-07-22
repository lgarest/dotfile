require("nvchad.options")
local utils = require("core.utils")

-- Personal Vim Options
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
		[".*js"] = "typescriptreact",
		[".*jsx"] = "typescriptreact",
	},
})
vim.opt.winbar = "%=%m %f"
vim.opt.swapfile = false
vim.opt.switchbuf = "vsplit"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Global settings
vim.g.have_nerd_font = true
vim.g.vscode_snippets_path = "~/personal/dotfile/my_snippets" -- Snippet paths

-- Set up folding after a slight delay to ensure TreeSitter is ready
vim.defer_fn(utils.setup_treesitter_folding, 50)

-- Set indentation to 2 spaces
utils.set_indentation(2)

-- Lazy load telescope extension to improve startup time
utils.setup_telescope_extensions()

-- Load autocommands
require("core.autocmds")
