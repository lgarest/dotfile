return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    -- NuiInput (the default popup) silently drops the completion= argument,
    -- so Tab path completion never works. vim.ui.input passes it through correctly.
    use_popups_for_input = false,
  },
}
