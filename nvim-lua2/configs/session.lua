-- Session Management Configuration
local M = {}

-- Auto-save session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    -- Only save session if we're in a git repository
    if vim.fn.isdirectory(".git") == 1 then
      local session_dir = vim.fn.stdpath("data") .. "/sessions"
      vim.fn.mkdir(session_dir, "p")
      
      local cwd = vim.fn.getcwd()
      local session_name = cwd:gsub("/", "%%"):gsub(":", "%%")
      local session_file = session_dir .. "/" .. session_name .. ".vim"
      
      -- Save session
      vim.cmd("mksession! " .. session_file)
    end
  end,
})

-- Auto-restore session on startup
vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    -- Only restore if no arguments were passed
    if vim.fn.argc() == 0 and vim.fn.isdirectory(".git") == 1 then
      local session_dir = vim.fn.stdpath("data") .. "/sessions"
      local cwd = vim.fn.getcwd()
      local session_name = cwd:gsub("/", "%%"):gsub(":", "%%")
      local session_file = session_dir .. "/" .. session_name .. ".vim"
      
      if vim.fn.filereadable(session_file) == 1 then
        vim.cmd("source " .. session_file)
      end
    end
  end,
})

-- Auto-save buffers on focus lost or buffer switch
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})

return M
