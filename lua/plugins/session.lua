return {
  "Shatur/neovim-session-manager",
  config = function()
    require'session_manager'.setup{autoload_mode=function() end}
    vim.keymap.set("n", "<leader>ss", ":SessionManager save_current_session<cr>")
    vim.keymap.set("n", "<leader>sl", ":SessionManager load_last_session<cr>")
    vim.keymap.set("n", "<leader>fs", ":SessionManager load_session<cr>")
  end
}
