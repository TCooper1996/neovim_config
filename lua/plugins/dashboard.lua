--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = keybind_opts or { noremap = true, silent = true, nowait = true }
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end
    --local buf = vim.api.nvim_get_current_buf()
    --vim.keymap.set('n', keybind)
    
    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end
return {
  {
    'goolord/alpha-nvim',
    dependencies = {"MaximilianLloyd/ascii.nvim"},
    config = function()
      local alpha = require 'alpha'
      local dashboard = require'alpha.themes.dashboard'
      local header = require'ascii.text.neovim'.sharp
      dashboard.section.header.val = header
      dashboard.section.buttons = {
        type = "group",
        opts = {
          spacing = 1,
        },
        val = {
          button("p", " Plugins", "lua require'telescope.builtin'.find_files{search_dirs = '~/.config/nvim/lua/plugins'} "),
          button("i", " Init"),
          button("r", "󰭴 Return to last session"),
        }
      }
      alpha.setup(dashboard.config)
    end
  },
  {
    "MaximilianLloyd/ascii.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    }
  }
};
