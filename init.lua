local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local opts = { change_detection = { notify = false } }
require("vim-options")
--require("lazy").setup({'folke/which-key.nvim'}, opts)
require("lazy").setup("plugins", opts)

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

-- then setup your lsp server as usual
local lspconfig = require('lspconfig')

-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

-- local lsp_zero = require('lsp-zero')
-- lsp_zero.on_attach(function(client, bufnr)
--   -- see :help lsp-zero-keybindings
--   -- to learn the available actions
--   lsp_zero.default_keymaps({ buffer = bufnr })
-- end)

-- -- to learn how to use mason.nvim with lsp-zero
-- -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   ensure_installed = {},
--   handlers = {
--     lsp_zero.default_setup,
--   },
-- })


local config = require("nvim-treesitter.configs")
config.setup({

  ensure_installed = { "lua", "javascript", "python", "elm" }
})



require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

require("mappings")
