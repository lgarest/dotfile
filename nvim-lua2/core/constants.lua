local M = {}

-- File paths
M.paths = {
  home = os.getenv("HOME"),
  notes = "~/personal/notes/",
  nvim_config = "~/personal/dotfile/nvim-lua2/",
  dotfiles = "~/personal/dotfile/",

  -- Config files
  biome_config = "/Users/lgarciae/personal/dotfile/biome.json",
  biome_good_config = "/Users/lgarciae/personal/dotfile/biome-good.json",

  -- Scripts
  tmux_sessionizer = "~/bin/tmux-sessionizer.sh",
  tmux_fzf_session = "~/bin/tmux-fzf-session.sh",
}

-- File mappings for quick access
M.files = {
  mappings = "~/.config/nvim/lua/mappings.lua",
  plugins = "~/.config/nvim/lua/plugins/init.lua",
  vim_cheatsheet = "~/personal/notes/vim.md",
  telescope_cheatsheet = "~/personal/notes/telescope.md",
  biome_config = "/Users/lgarciae/personal/dotfile/biome.json",
}

-- LSP servers list
M.lsp = {
  servers = { "html", "cssls", "ts_ls", "biome", "tailwindcss" }
}

return M
