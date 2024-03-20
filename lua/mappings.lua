-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>gh', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


vim.keymap.set({ 'i', 'n' }, '<D-k>', '<esc>ki')
vim.keymap.set({ 'i', 'n' }, '<D-h>', '<esc>i')
vim.keymap.set({ 'i', 'n' }, '<D-l>', '<esc>2li')
vim.keymap.set({ 'i', 'n' }, '<D-j>', '<esc>ji')

vim.keymap.set({ 'n', 'v' }, 'J', '10j')
vim.keymap.set({ 'n', 'v' }, 'K', '10k')

vim.keymap.set({ 'i', 'n' }, '<D-[>', '<cmd>bprev<cr>')
vim.keymap.set({ 'i', 'n' }, '<D-]>', '<cmd>bnext<cr>')
vim.keymap.set({ 'i', 'n' }, '<D-w>', '<cmd>bd<cr>')


vim.keymap.set('n', '<leader>qq', ':wqa<cr>')



vim.keymap.set({ 'i', 'n' }, '<D-s>', '<cmd>wa<cr>')

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local wk = require'which-key'
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'LSP Hover' }))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, vim.tbl_extend('force', opts, {desc = 'Format Buffer'}))
  end,
})


-- Telescope
