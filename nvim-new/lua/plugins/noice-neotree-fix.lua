-- blink.cmp's cmdline source doesn't invoke v:lua-based custom completion functions,
-- so neo-tree's :Neotree Tab completion never fires. Disabling cmdline lets native
-- Neovim handle it, which calls the registered complete= function correctly.
return {
  "saghen/blink.cmp",
  opts = {
    cmdline = {
      enabled = false,
    },
  },
}
