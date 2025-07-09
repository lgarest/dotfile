local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettierd" },
		html = { "prettierd" },
		typescript = { "biome", "prettierd" },
		-- typescriptreact = { "biome", "prettierd" },
		typescriptreact = {
		    biome = {
		      append_args = { "--write", "--config-path", "/Users/lgarciae/personal/dotfile/biome.json" },
		    }
    },
		-- 	-- biome = function()
		-- 	-- 	return {
		-- 	-- 		command = "biome",
		-- 	-- 		-- args = { "--write", "--config-path='/Users/lgarciae/personal/dotfile/biome.json'" },
		-- 	-- 		args = { "--write" },
		-- 	-- 		-- args = { "format", "--write", "--config-path='/Users/lgarciae/personal/dotfile/biome.json'"  }
		-- 	-- 	}
		-- 	-- end,
		-- },

		markdown = { "markdownlint" },
	},

	-- format_on_save = {
	-- 	-- These options will be passed to conform.format()
	-- 	timeout_ms = 500,
	-- 	lsp_fallback = true,
	-- },
}

require("conform").setup(options)
