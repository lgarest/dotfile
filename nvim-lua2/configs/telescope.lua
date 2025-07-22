return {
	defaults = {
		path_display = {
			shorten = { len = 3, exclude = { 1, -2, -1 } },
		},
		layout_config = {
			width = 0.99,
			height = 0.99,
		},
		mappings = {
			i = {
				["<c-d>"] = function(...)
					local actions = require("telescope.actions")
					return (actions.delete_buffer + actions.move_to_top)(...)
				end,
			},
		},
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = function(...)
						local actions = require("telescope.actions")
						return (actions.delete_buffer + actions.move_to_top)(...)
					end,
				},
			},
		},
	},
	vimgrep_arguments = {
		"rg",
		"-L",
		"--vimgrep",
		"--hidden",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
	},
	extensions = {
		frecency = {
			auto_validate = false,
			matcher = "fuzzy",
			show_unindexed = true,
			show_filter_column = false,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
		},
	},
}
