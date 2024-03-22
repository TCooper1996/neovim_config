return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local wk = require 'which-key'
      wk.register({
      })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ['<D-k>'] = require("telescope.actions").move_selection_previous,
              ['<D-j>'] = require("telescope.actions").move_selection_next,
              ['<D-Space>'] = require("telescope.actions").select_default,
            }
          }
        },
        extensions = {

          ["ui-select"] = { require("telescope.themes").get_dropdown {} }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
