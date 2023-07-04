local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins
local formatting = b.formatting
local lint = b.diagnostics

local sources = {

  -- webdev stuff
  formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  formatting.prettier.with { filetypes = { "html", "css", "json", "md" } }, -- so prettier works only on these filetypes
  formatting.markdownlint,
  lint.markdownlint,
  lint.shellcheck,

  -- Lua
  formatting.stylua,

  -- cpp
  formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
