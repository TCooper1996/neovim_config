return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false
  },
  {
    "folke/neodev.nvim",
    lazy = false,
    config = function() end
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require'mason'.setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function() end
  }

}
