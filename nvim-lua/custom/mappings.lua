---@type MappingsTable
local M = {}

M.disabled = {
  n = {

    ["<leader>e"] = "", -- remove focus treesitter diagnostics for current file

    ["<leader>rn"] = "", -- remove toggle relative number

    ["<leader>x"] = "", -- remove close buffer

    ["<leader>n"] = "", -- remove line numbers

    ["<leader>/"] = "", -- remove toggle comment

    ["<leader>cm"] = "", -- remove Telescope git_commits <CR>

    ["<leader>gr"] = "", -- remove Lsp go to references<CR> -> telescope one

    ["<leader>gb"] = "",
    -- ["<leader>gb"] = {
    --   function()
    --     package.loaded.gitsigns.blame_line()
    --   end,
    --   "Blame line",
    -- },

    -- ["<leader>fb"] = "", -- remove Telescope buffers

    ["<c-n>"] = "", -- remove nvimtree toggle
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

    ["\\e"] = { "<cmd> NvimTreeFindFile! <CR>", "Find file in nvimtree [e]xplorer" },
    ["\\n"] = { "<cmd> NvimTreeToggle <CR>", "Open/Close nvimtree" },

    -- rompe
    ["gs"] = { "<cmd> split <CR>gd z<CR>", "goto definition in [s]plit", opts = { remap = true } },
    ["gv"] = { "<cmd> vsplit <CR>gd z<CR>", "goto definition in [v]split", opts = { remap = true } },
    -- ["gv"] = {
    -- 	function()
    -- 		require("telescope.builtin").lsp_definitions({ layout_strategy = "vertical" })
    -- 	end,
    -- 	"[g]oto definition in [v]split",
    -- 	opts = { remap = true },
    -- },
    ["gw"] = {
      function()
        require("leap").leap { target_windows = require("leap.util").get_enterable_windows() }
      end,
      "Jump in window",
    },

    ["gF"] = { "<cmd> vsplit <CR>gf", "goto [F]ile in vsplit", opts = { remap = true } },
    ["<leader>ts"] = { "<cmd> set spell! <CR>", "set [s]pell!" },
    ["<leader>rp"] = {
      function()
        vim.cmd "w!"
        vim.cmd "!biome format --write --config-path='/Users/lgarciae/dev/dotfile/biome.json' %"
      end,
      "run current buffer through [p]rettier",
    },
    ["<leader>rn"] = {
      function()
        vim.cmd "! bun %"
      end,
      "run current buffer through [n]ode repl (TS)",
    },
    ["<leader>re"] = {
      function()
        vim.cmd "!$(which biome) lint --config-path=/Users/lgarciae/dev/dotfile/biome.json --apply %"
      end,
      "run current buffer through biom[e]",
    },
    ["<leader>xx"] = { ":. !sh <CR>", "execute current command inline" },

    ["<leader>cb"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "close [b]uffer",
    },
  },
  v = {
    ["<leader>xx"] = { ":. !sh <CR>", "execute e[x]ecutable line" },
    ["J"] = { "<cmd> m '>+1 <CR>gv=gv" },
    ["K"] = { "<cmd> m '<-2 <CR>gv=gv" },
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
    ["<C-f>"] = { "<cmd> silent !tmux neww tmux-sessionizer.sh <CR>" },
    ["<C-s>"] = { "<cmd> silent !tmux neww tmux-fzf-session.sh <CR>" },
    ["<C-g>"] = { "<cmd> silent !tmux neww lazygit <CR>" },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Window right" },
  },
}
M.luaSnip = {
  n = {
    ["<leader>os"] = {
      function()
        vim.cmd "vsplit"
        require("luasnip.loaders").edit_snippet_files()
      end,
      "open [s]nippet files",
    },
    ["<leader>om"] = { "<cmd> tabnew ~/.config/nvim/lua/custom/mappings.lua <CR>", "open [m]appings file" },
    ["<leader>on"] = { "<cmd> tabnew ~/dev/notes/ <CR>", "open [n]otes file" },
    ["<leader>oh"] = { "<cmd> tabnew ~/dev/notes/vim.md <CR>", "open vim c[h]eatsheet" },
    ["<leader>ot"] = { "<cmd> tabnew ~/dev/notes/telescope.md <CR>", "open [t]elescope cheatsheet" },
    ["<leader>o,"] = { "<cmd> tabnew ~/.config/nvim/lua/custom/plugins.lua <CR>", "open plugins file" },
    ["<leader>op"] = { "<cmd> tabnew ~/.config/nvim/lua/custom/plugins.lua <CR>", "open [p]lugins file" },
  },
}
M.telescope = {
  n = {
    ["<leader>fB"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "fzf find in current [B]uffer" },
    ["<leader>fC"] = { "<cmd> Telescope commands <CR>", "Search/find [C]ommands" },
    ["<leader>fM"] = { "<cmd> Telescope marks <CR>", "find [M]arks" },
    ["<leader>fR"] = { "<cmd> Telescope registers <CR>", "Search/find r[e]gisters" },
    ["<leader>fc"] = { "<cmd> Telescope grep_string <CR>", "Search/find [c]urrent word" },
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "find [d]iagnostics" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Search/find [k]eymaps" },
    ["<leader>fl"] = { ":Telescope live_grep search_dirs=./", "Search/find in fo[l]der" },
    ["<leader>fr"] = { "<cmd> Telescope resume <CR>", "resume previous Telescope [f]ind" },
    ["<leader>ft"] = { "<cmd>Telescope grep_string search=@TODO<CR>", "find [t]odos" },
    ["<leader>gr"] = { "<cmd> Telescope lsp_references <CR>", "goto [r]eferences" },
    ["<leader>gs"] = { "<cmd> Telescope git_status<CR>", "git [s]tatus" },
    ["<leader>go"] = { "<cmd> Telescope git_branches<CR>", "git check[o]ut" },
    ["<C-p>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    -- ["<C-p>"] = { "<cmd> Telescope find_files follow=true<CR>", "Find all" },
    -- ["<C-S-p>"] = { "<cmd> Telescope oldfiles additional_args={ previewer=false }<CR>", "Find old files" },
  },
}
M.treesitter = {
  n = {
    ["<leader>fs"] = {
      "<cmd> Telescope treesitter ignore_symbols={'import'}<CR>",
      "Open/find treesitter [s]ymbols",
    },
  },
}
M.vimfugitive = {
  n = {
    ["<leader>gg"] = {
      function()
        vim.cmd "tab G"
        vim.cmd "h fugitive-staging-maps"
        vim.cmd "wincmd L"
        vim.cmd "wincmd h"
      end,
      "Open fugitive status / goto [g]it",
    },
    -- ["<leader>gL"] = { "<cmd> GV<CR>" },
    ["<leader>gl"] = { "<cmd> GV!<CR>", "git [l]og" },
    ["<leader>gb"] = { "<cmd> G blame<CR>", "git [b]lame" },
    ["<leader>gp"] = { "<cmd> Gitsigns preview_hunk<CR>" },
    -- ["<leader>gs"] = { ":Git switch ", "git [s]witch" },
    -- nmap <space>gB :G blame<CR>
    -- nmap <space>gg :tab G<CR>g?
    -- nmap <space>gd :tab G diff<CR>
    -- nmap <space>gb :G branch<CR>
    -- nmap <space>gB :G blame<CR>
    -- nmap <space>gL :GV<CR>
    -- nmap <space>gl :GV!<CR>
    -- nmap <space>gf :G fetch --all --prune<CR>
    -- nmap <space>grm :G rebase origin/main<CR>

    -- remove Telescope git_commits <CR>
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git [c]ommits" },
    -- ["<space>gL"] = {
    -- 	function()
    -- 		vim.cmd("tab G")
    -- 		vim.cmd("wincmd L")
    -- 		vim.cmd("wincmd h")
    -- 	end,
    -- 	"Open fugitive status",
    -- },
  },
  v = {
    ["gh"] = { "<cmd> diffget //2 <CR>" },
    ["gl"] = { "<cmd> diffget //3 <CR>" },
  },
}
M.tj = {
  n = {},
}
M.treesj = {
  plugin = true,
  n = {
    ["<leader>fj"] = { "<cmd> TSJToggle <CR>", "format [j]oin toggle" },
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "[d]ebugger add [b]reakpoint" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>", "[d]ebugger [r]esume session" },
  },
}
M.undotree = {
  plugin = true,
  n = {
    ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "toggle [u]ndotree" },
  },
}
M.copilot = {
  plugin = true,
  n = {
    ["<leader>tc"] = {
      function()
        require("custom.configs.copilot").toggle_copilot()
      end,
      "[t]oggle [c]opilot",
    },
  },
  i = {
    -- add lua copilot
    -- ['<C-y>'] = {
    --     '<cmd>copilot#Accept("<CR>")<CR>',
    --   "accept copilot suggestion"
    -- }
  },
}
M.bettertserrors = {
  plugin = true,
  n = {
    ["<leader>te"] = {
      function()
        require("better-ts-errors").toggle()
      end,
      "toggle [t]ypescript [e]rrors",
    },
    ["<leader>dx"] = {
      function()
        require("better-ts-errors").goToDefinition()
      end,
      "go to [d]efinition",
    },
  },
}
-- M.dap_js = {
--   -- plugin = true,
--   n = {
--     ['<leader>dpr'] = {
--       function ()
--         require('dap-vscode-js').test_method()
--       end
--
--     },
--   }
-- }
-- try rg
-- vim.cmd("command! -nargs=+ -complete=file Grep noautocmd rg! <args> | redraw! | copen")
-- vim.cmd("command! -nargs=+ -complete=file LGrep noautocmd rg! <args> | redraw! | lopen")
vim.keymap.set("i", "<C-y>", 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

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
-- nmap <space>gg :tab G <CR>g?
-- nnoremap <space>gd :tab G diff <CR>
-- nnoremap <space>gb :G branch <CR>
-- nnoremap <space>gB :G blame <CR>
-- nnoremap <space>gL :GV <CR>
-- nnoremap <space>gl :GV! <CR>
-- nnoremap <space>gf :G fetch --all --prune <CR>
-- nnoremap <space>grm :G rebase origin/main <CR>
return M
