function find_workspaces(opts)
  opts = opts or {}
  local pickers = require'telescope.pickers'
  local finders = require"telescope.finders"
  local conf = require('telescope.config')

  local ws = vim.lsp.buf.list_workspace_folders()

  pickers.new(opts, {
    prompt_title = "Workspaces",
    finder = finders.new_table {
      results = ws
    }
  }):find()

end

find_workspaces({})
