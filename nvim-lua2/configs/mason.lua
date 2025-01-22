local options = {
	ensure_installed = {
		-- languages
		"lua-language-server",
		"stylua",
		"markdownlint",
		"hadolint",
		"yaml-language-server",
		"dockerfile-language-server",

		-- web dev stuff
		"html-lsp",
		"css-lsp",
		-- "eslint-lsp",
		"prettierd",
		"biome",
		"tailwindcss-language-server",
		-- "nginx-language-server",
		"graphql-language-service-cli",
		-- "prisma-language-server",

		-- dap
		"node-debug2-adapter",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- bash
		"bash-language-server",
		"beautysh",
	},
}
return options
