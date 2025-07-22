-- Auto-open nvim-tree when opening directory
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

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Command abbreviations for common typos
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
