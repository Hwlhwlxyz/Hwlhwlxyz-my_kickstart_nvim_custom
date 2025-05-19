-- add to init.lua { import = 'custom.module.my-lsp-related', },
return {
{
  "hedyhli/outline.nvim",
  lazy = true,
  keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
  cmd = "Outline",
  opts = function()
    local defaults = require("outline.config").defaults
    local opts = {
auto_close = true,
      keymaps = {
        up_and_jump = "<up>",
        down_and_jump = "<down>",
      },
    }

    return opts
  end,
},
{
  "folke/trouble.nvim",
  optional = true,
  keys = {
    { "<leader>cs", false },
  },
}
}