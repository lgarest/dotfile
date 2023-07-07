---@type MappingsTable
local M = {}

M.disabled = {
  n = {

    ["<leader>e"] = "", -- remove focus nvimtree diagnostics for current file

    ["<leader>rn"] = "", -- remove toggle relative number

    ["<leader>x"] = "", -- remove close buffer

    ["<leader>n"] = "", -- remove line numbers

    ["<leader>/"] = "", -- remove toggle comment

    ["<leader>cm"] = "", -- remove Telescope git_commits <CR>
  },
  v = {
    ["J"] = "",
    ["C-c"] = "",
    -- ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  },
  t = {
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },
}



M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["\\e"] = { "<cmd>NvimTreeFindFile!<CR>", "Find file in nvimtree" },

    -- rompe
    ["gs"] = { "<cmd>split<CR>gd", "Open definition in split", opts = { remap = true } },
    ["gv"] = { "<cmd>vsplit<CR>gd", "Open definition in vsplit", opts = { remap = true } },
    ["gw"] = {
      function()
        require("leap").leap { target_windows = require("leap.util").get_enterable_windows() }
      end,
      "Jump in window",
    },

    ["gF"] = { "<cmd>vsplit<CR>gf", "Open file in vsplit", opts = { remap = true } },
    ["<leader>ts"] = { "<cmd>set spell!<CR>" },
    ["<leader>rp"] = {
      function()
        vim.cmd "w!"
        vim.cmd "!$(which prettier) --config ~/dev/dotfile/prettierrc --write %"
      end,
      "Run current buffer through prettier",
    },
    ["<leader>rn"] = {
      function()
        vim.cmd "! $(which node) -i %"
      end,
      "Run current buffer through node repl",
    },
    ["<leader>re"] = {
      function()
        vim.cmd "!npx eslint --config ~/dev/bx-evaluation-and-selection/.eslintrc.cjs --fix %"
      end,
      "Run current buffer through eslint --fix",
    },
    ["<leader>xx"] = { ":. !sh<CR>" },

    ["<leader>cb"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
  v = {
    ["<leader>xx"] = { ":. !sh<CR>" },
    ["J"] = { "<cmd>m '>+1<CR>gv=gv" },
    ["K"] = { "<cmd>m '<-2<CR>gv=gv" },
  },
  t = {
    ["<Esc>"] = { "<C-\\><C-n>" },
  },
}

M.lsp = {
  n = {
    -- ["<leader>e"] = {
    --   function()
    --     vim.diagnostic.open_float()
    --   end,
    --   "Open diagnostic for current line",
    -- },
  },
}
M.tmux = {
  n = {
    ["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>" },
    ["<C-s>"] = { "<cmd>silent !tmux neww tmux-fzf-session.sh<CR>" },
    ["<C-g>"] = { "<cmd>silent !tmux neww lazygit<CR>" },
  },
}
M.luaSnip = {
  n = {
    ["<leader>os"] = {
      function()
        vim.cmd "vsplit"
        require("luasnip.loaders").edit_snippet_files()
      end,
      "Open snippet files",
    },
    ["<leader>om"] = { "<cmd>tabnew ~/.config/nvim/lua/custom/mappings.lua<CR>", "Open mappings file" },
    ["<leader>on"] = { "<cmd>tabnew ~/dev/notes/<CR>", "Open notes file" },
    ["<leader>oh"] = { "<cmd>tabnew ~/dev/notes/vim.md<CR>", "Open help file" },
    ["<leader>o,"] = { "<cmd>tabnew ~/.config/nvim/lua/custom/plugins.lua<CR>", "Open plugins file" },
  },
}
M.telescope = {
  n = {
    ["<leader>fc"] = { "<cmd>Telescope grep_string<CR>", "Search for current word" },
    ["<leader>fr"] = { "<cmd>Telescope resume<CR>", "Resume previous Telescope picker" },
    ["<C-p>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<C-P>"] = { "<cmd> Telescope oldfiles<CR>", "Find old files" },
  },
}
M.vimfugitive = {
  n = {
    ["<space>gg"] = {
      function()
        vim.cmd "tab G"
        vim.cmd "h fugitive"
        vim.cmd "wincmd L"
        vim.cmd "wincmd h"
      end,
      "Open fugitive status",
    },

    -- remove Telescope git_commits <CR>
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<space>gL"] = {
      function()
        vim.cmd "tab G"
        vim.cmd "wincmd L"
        vim.cmd "wincmd h"
      end,
      "Open fugitive status",
    },
  },
  v = {
    ["gu"] = { "<cmd>diffget //2<CR>" },
    ["gh"] = { "<cmd>diffget //3<CR>" },
  },
}
-- try rg
-- vim.cmd("command! -nargs=+ -complete=file Grep noautocmd rg! <args> | redraw! | copen")
-- vim.cmd("command! -nargs=+ -complete=file LGrep noautocmd rg! <args> | redraw! | lopen")

-- more keybinds!
vim.cmd [[
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
    cnoreabbrev Vs vs
    cnoreabbrev VS vs
    cnoreabbrev vS vs
    cnoreabbrev Ack Ack!
    command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
]]

-- vim-fugitive
-- nmap <space>gg :tab G<CR>g?
-- nnoremap <space>gd :tab G diff<CR>
-- nnoremap <space>gb :G branch<CR>
-- nnoremap <space>gB :G blame<CR>
-- nnoremap <space>gL :GV<CR>
-- nnoremap <space>gl :GV!<CR>
-- nnoremap <space>gf :G fetch --all --prune<CR>
-- nnoremap <space>grm :G rebase origin/main<CR>
return M
