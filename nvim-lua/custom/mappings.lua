---@type MappingsTable
local M = {}

M.disabled = {
  v = {
    ["J"] = "",
    ["C-c"] = "",
    ["<leader>e"] = "",
    ["<leader>rn"] = "",
    ["<leader>tr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["\\e"] = { "<cmd>NvimTreeFindFile<CR>", "Find file in nvimtree" },


    ["gs"] = { "<cmd>vsplit<CR>gd", "Open definition in vsplit", opts = { remap = true } },
    ["gF"] = { "<cmd>vsplit<CR>gf", "Open file in vsplit", opts = { remap = true } },
    ["<leader>ss"] = { "<cmd>set spell!<CR>" },
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
    ["<leader>e"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "Open diagnostic for current line",
    },
  },
}
M.tmux = {
  n = {
    ["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>"},
    ["<C-s>"] = { "<cmd>silent !tmux neww tmux-fzf-session.sh<CR>"},
    ["<C-g>"] = { "<cmd>silent !tmux neww lazygit<CR>"},
    -- " tmux sessionizer
    -- nmap <silent> <C-f> :silent !tmux neww tmux-sessionizer.sh<CR>
    -- nmap <silent> <C-s> :silent !tmux neww tmux-fzf-session.sh<CR>
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
    ["<leader>,"] = { "<cmd>tabnew ~/.config/nvim/lua/custom/plugins.lua<CR>", "Open plugins file" },
  },
}
M.telescope = {
  n = {
    ["<leader>fc"] = { "<cmd>Telescope grep_string<CR>", "Search for current word" },
    ["<leader>fr"] = { "<cmd>Telescope resume<CR>", "Resume previous Telescope picker" },
    ["<C-p>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<C-P>"] = { "<cmd> Telescope oldfiles<CR>", "Find recent" },
  },
}
M.vimfugitive = {
  n = {
    ["<space>gg"] = {
      function()
        vim.cmd "tab G"
        vim.cmd "h fugitive"
        vim.cmd "wincmd L"
      end,
      "Open fugitive status",
    },
    ["<space>gL"] = {
      function()
        vim.cmd "tab G"
        vim.cmd ""
        vim.cmd "wincmd L"
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
